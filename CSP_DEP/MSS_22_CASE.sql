SELECT DepID, DepartmentName,
	CASE
		When DepartmentName = 'IT' Then 'INFORMATION TECHNOLOGY'
		When DepartmentName = 'HR' Then 'HUMAN RESOURCES'
		When DepartmentName = 'FI' Then 'FINANCIAL INSTITUTION'
	END As 'Department Long Name'
FROM tableDepartments;

SELECT DepID, DepartmentName,
	CASE DepartmentName
		When 'IT' Then 'INFORMATION TECHNOLOGY'
		When 'HR' Then 'HUMAN RESOURCES'
		When 'FI' Then 'FINANCIAL INSTITUTION'
	END As 'Department Long Name'
FROM tableDepartments;

SELECT DepID, DepartmentName,
	CASE DepartmentName
		When 'IT' Then 'INFORMATION TECHNOLOGY'
		When 'HR' Then 'HUMAN RESOURCES'
		ELSE 'FINANCIAL INSTITUTION'
	END As 'Department Long Name'
FROM tableDepartments;
