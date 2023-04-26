import sys
import pandas as pd
import numpy as np
import plotext
import matplotlib.pyplot as plt
from mysql.connector import connect, Error
from getpass import getpass
import warnings
warnings.filterwarnings("ignore")

# Establishing connection with the DB
def connectionObject():
	host = 'localhost'
	username = input("Please enter the username to connect to the DB\n")
	password = getpass("Please enter the password\n")
	database = 'project'

	print("Connecting to DB")

	try:
		conn = connect(
			host=host,
			user = username,
			password = password,
			database = database)
		print("Connection established successfully")
		return conn
	except Error as e:
		print(e)
		print("Unable to connect to the database, please try again")
		return None

# Print all the available options
def printOptions():
	print("\n\nWelcome to Beach View Resort\n\n")
	print('{:-^50}'.format('Choose from the following queries'))

	# Insert query
	print("1. Add Employee in department 'Security'")

	# Update query
	print("2. Update customer First name based on contact no")

	# Delete query
	print("3. Delete an employee by name")

	# Query with more than 3 table join
	print("4. For Beach View Resort get all the required room information")

	# Views
	print("5. What are the available utilities in the resort")
	print("6. Get employee info (Salary not included)")

	# Stored Procedures
	print("7. For a given department show the no of employees")
	print("8. Get membership discount of a customer using contact no")
	print("9. What are the most used meal plan details by customers")

	# Functions
	print("10. Get the bill amount after the discount for customer using contact info")
	print("11. Which month has the most bookings 'or' Peak month of the year")
	print("12. Check if the room is available for booking")

	#Statistics
	print("13. Show statistics for peak time of the year")
	print("14. Show statistics of employee in each department")

	print("15. Print all the options again")
	print("16. Exit the application")
	print("")
	return None

# All the queries
def Query(conn, check):

	# Queries
	# Insert
	print("")
	if check == '1':
		# Get employee details
		emp_name = input("Enter employee name\n")
		age = int(input("Enter employee age\n"))
		salary = int(input("Enter employee salary\n"))
		department_id = 4
		mobile_no = int(input("Enter employee mobile no\n"))
		query = """INSERT into employee (name, age, salary, department_id, mobile_no) VALUES (%s, %s, %s, %s, %s)"""
		val = (emp_name, age, salary, department_id, mobile_no)
		cursor = conn.cursor()
		try:
			cursor.execute(query, val)
			print(cursor.rowcount, "Employee details inserted successfully.")
			conn.commit()
		except Exception as e:
			print(e)
			print("Unable to insert, please check and try again")

	# Update
	elif check == '2':
		mycursor = conn.cursor()
		contact_no = input("Enter the contact of the customer to update the first name\n")
		first_name = input("Enter the name to update First Name\n")
		sql = "UPDATE customer SET first_name = %s WHERE contact = %s"
		val = (first_name, contact_no)
		try:
			mycursor.execute(sql,val)
			conn.commit()
			print(mycursor.rowcount, "Customer name successfully updated")
		except Exception as e:
			print(e)
			print("Unable to update, please check and try again")

	# Delete
	elif check =='3':
		mycursor = conn.cursor()
		sql = "DELETE FROM employee WHERE name = %s"
		emp_name = input("Enter employee name to delete\n")
		emp_name = (emp_name,)
		try:
			mycursor.execute(sql, emp_name)
			conn.commit()
			print(mycursor.rowcount, "Employee deleted successfully")
		except Exception as e:
			print(e)
			print("Unable to delete, please check and try again")

	# Joins
	elif check == '4':
		query = """SELECT 
					rm.room_no AS Room_Number,
					rt.room_type AS Room_Type,
					rt.discount_percent AS Discount_per_room,
					rt.smoke_friendly AS Smoke_friendly,
					rt.pet_friendly AS Pet_friendly,
					rt.cost AS Cost_in_USD,
					rs.status AS Room_status
				FROM
					resort r,
					rooms rm,
					room_type rt,
					room_status rs
				WHERE
					r.resort_id = rm.resort_id
						AND rm.room_id = rt.room_id
						AND rm.room_id = rs.room_id
						AND r.resort_name = 'Beach View Resort';"""

		result = pd.read_sql(query, conn)

		# Update column data based on the conditions
		result["Smoke_friendly"] = np.where(result["Smoke_friendly"] == 0, 'No', 'Yes')
		result["Pet_friendly"] = np.where(result["Pet_friendly"] == 0, 'No', 'Yes')
		result["Room_status"] = np.where(result["Room_status"] == 0, 'Not Available', 'Available')

		print(result.to_string(index=False))

	# Views
	elif check =='5':
		query = """SELECT 
					*
				FROM
					available_utilities;"""
		result = pd.read_sql(query, conn)
		print(result.to_string(index=False))

	elif check == '6':
		query = """SELECT 
					*
				FROM
					employee_info;"""
		result = pd.read_sql(query, conn)
		print(result.to_string(index=False))

	# Stored Procedures
	elif check =='7':
		department_name = input("Enter department name to get the no of employees\n")
		mycursor = conn.cursor()
		mycursor.callproc('get_department_employees', [department_name,])

		result = []
		for results in mycursor.stored_results():
			result.append(results.fetchall()[0])

		result = pd.DataFrame(result, columns=['Department_Name', 'Number_Of_Employees'])
		print(result.to_string(index=False))
		mycursor.close()

	elif check =='8':
		contact = input("Enter contact number to get membership discount\n")
		mycursor = conn.cursor()
		mycursor.callproc('get_membership_discount', [contact,])

		result = []
		for results in mycursor.stored_results():
			result.append(results.fetchall()[0])

		result = pd.DataFrame(result, columns=['First_Name', 'Last_Name', 'Discount_In_Percent'])
		print(result.to_string(index=False))
		mycursor.close()

	elif check =='9':
		mycursor = conn.cursor()
		mycursor.callproc('get_most_used_meal_plan_details')

		result = []
		for results in mycursor.stored_results():
			result.append(results.fetchall()[0])

		result = pd.DataFrame(result, columns=['Meal_Plan_Name', 'Cost_In_USD'])
		print(result.to_string(index=False))
		mycursor.close()

	# Functions
	elif check =='10':
		contact = input("Enter contact number to get final bill after discount\n")
		query = """SELECT BILL_AMOUNT_AFTER_DISCOUNT({0}) as Bill_After_Discount;""".format(contact)
		result = pd.read_sql(query, conn)
		print(result.to_string(index=False))

	elif check =='11':
		query = """SELECT PEAK_TIME_OF_THE_YEAR() as Peak_Time;"""
		result = pd.read_sql(query, conn)
		print(result.to_string(index=False))

	elif check =='12':
		room_no = input("Enter room number to check if it is available or not\n")
		query = """SELECT ROOM_AVAILIBITY({0}) as Room_Status;""".format(room_no)
		result = pd.read_sql(query, conn)
		print(result.to_string(index=False))

	# Statistics
	elif check =='13':
		query = """	select monthname(check_in) as month, count(*) as customer_count
					from booking 
					group by Month(check_in)"""
		result = pd.read_sql(query, conn)
		x = result['month'].tolist()
		y = result['customer_count'].tolist()
		plotext.title("Monthly Distribution of Customers")
		plotext.bar(x, y)
		plotext.show()

	elif check =='14':
		query = """ select dep_name, count(*) as employee_count 
		            from employee, department 
		            where employee.department_id = department.department_id 
				    group by employee.department_id"""
		result = pd.read_sql(query, conn)
		x = result['dep_name'].tolist()
		y = result['employee_count'].tolist()
		# plot using plotext
		plotext.title("Employee per department")
		plotext.bar(x, y)
		plotext.show()

		# plot using matplot
		# fig, ax = plt.subplots(figsize=(6, 6))
		# ax.pie(y, labels=x, autopct='%1.1f%%')
		# ax.set_title('Employee per department')
		# plt.tight_layout()
		# plt.show()

	print("")
	return 0


# Choosing query from the given options
def checkQuery(conn):
	printOptions()
	option = 0
	available_queries = [str(i) for i in range(1,15)]

	# Wait till an options is provided and check if the option is valid or not and proceed further
	while option != None:
		print("Select one of the options for the query result")
		check = input()
		if check == '16' or check == 'exit':
			print("Exiting the application")
			option = None
		elif check == '15':
			printOptions()
		elif check in available_queries:
			# Get the sql query solution
			option = Query(conn, check)
		else:
			print("Option does not exist, try again")


# Start/Main part of the program
if __name__=='__main__':
	print('{:-^50}'.format('Starting the application'))

	# Check if the connection is established
	tries,conn = 0,None
	while conn == None:
		if tries == 3:
			print('{:-^70}'.format('Maximum tries exhausted, exiting the application'))
			sys.exit(0)
		conn = connectionObject()
		tries += 1

	# Choosing the query
	checkQuery(conn)

	conn.close()
	print('{:-^50}'.format('End of the application'))
