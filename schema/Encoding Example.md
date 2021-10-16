# DAX Templates

DAX is easy to learn but difficult to master.

For this reason the DAX Quick Templates project has been started. The core of this project is to enable usage of DAX statements across multiple models. We know that each data model will contain unique assets. However, DAX statements can be generalized. Thus, tooling can be built to allow users to easily add measures into 

## Who is this for?
Business Users 
- Beginners
- Advanced Users

Developers

## Core Concepts

```
Count of Rows = COUNTROWS( 'TableName' )
NewTableName = SUMMARIZE('TableName', 'TableName'[Products], "ExpressionName", [Count of Rows] )
```

```
Param1 = "Count of Rows"
Param2 = "TableName"
Param3 = "NewTableName"
Param4 = "Products"
Param5 = "ExpressionName"

Param1 = COUNTROWS( 'Param2' )
Param3 = SUMMARIZE('Param2', 'Param2'[Param4], "Param5", [Param1] )
```