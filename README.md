# DAX Templates

Gallery for Collection of relevant measures, tables, and columns generated from DAX.

DAX is easy to learn but difficult to master.

For this reason the DAX Quick Templates project has been started. The core of this project is to enable usage of DAX statements across multiple models. We know that each data model will contain unique assets. However, DAX statements can be generalized. Thus, tooling can be built to allow users to easily add measures into 

## Who is this for?
Business Users 
- Beginners
    - Users who are starting to learn DAX
    - Might need a to add DAX templates into their data model but don't understand all the concepts of filter context
    - Individuals who are going to use pre-build DAX templates

- Advanced Users
    - Users who are looking to create their own templates for internal or sharing templates
    - Understands the more advanced features of DAX
    - Users who are looking to create templates to remove repetitive work from creating the same DAX measures over and over again

Developers
    - Individuals who are focused on developing robust data models in Power BI Desktop
    - Understands DAX and how to write complex DAX formulas for Tables, and Measures

# Contributing to the Project

Thank you for checking out the Repo.  This project is only a success by the community building and creating amazing templates. 

To begin contributing to the project. Please read the following getting started.

## Getting started
1. Users wishing to create templates will need to begin by installing DAX Generator created by Didier Terrien. This can be found in the [Business Ops External tools Installer](https://powerbi.tips/product/business-ops/).

1. Once the Business Ops tool has been installed on your PC. Add the DAX generator external tool using the following steps:
    - Open Business Ops
    - Click on the **Add External Tools** nav item on the left navigation pane
    - Scroll down to find the name **Didier Terrien**
    - **Click** on the **Checkbox** next to **DAX Generator**. This will install the external tool into your power BI desktop application.
    - be sure to **Restart** Power BI Desktop as External Tools are only added during the start up process of Power BI Desktop

1. Create a DAX Template using [DAX.powerbi.tips](https://dax.powerbi.tips/)
    - Be sure to include as much information as possible
    - Best practice is to provide some sort of link to a document / blog article that illustrates how to use your measure. 

1. Once the DAX template has been made download the DAX template

1. Test the DAX template by adding it into the DAX Generator
    - **Open** DAX Generator from the Power BI External Tools ribbon
    - **Drag** the downloaded ***.qdt.json** file into **DAX Generator**.  This will create a file inside DAX generator that can be used in the data model. 
    - Enter your parameters and test that the DAX template is working correctly

1. Fork the [DAX Templates](https://github.com/PowerBI-tips/DAX-Templates) github repo

1. Add your Quick DAX Template into the git repo and create a pull request to add your template

## Submissions

Please only submit *.qdt.json files into the templates folder. 

Each Author Submitting files should create a name for their submission, then create a named folder for the quick template. This enables users who wish to submit a PBIX file in addition to a quick dax template into the repo.

## template folder structure

```
template
│
└─── Author1 Name
│   │
│   └─── Quick Measure Name
│       │   *qdt.json
│       │   Sample.PBIX (optional)
│   
└─── Author2 Name
│   │
│   └─── Quick Measure Name
│       │   *qdt.json
│       │   Sample.PBIX (optional)
```

## Please Format the *.qdt.json
In order to make the quick DAX templates more human readable please format the JSON files. 

If you are using Studio Code to open the `*.qdt.json` files you can use the short cut key `Shift + Alt + f` to automatically format the json file.

> It is recommended to open JSON files with Studio Code. If you don't have this program please [download it here](https://code.visualstudio.com/download).

## Creating a Pull request
This describes the process of adding your designed DAX templates to this repo. 

1. Create a Fork of the [DAX-Templates](https://github.com/PowerBI-tips/DAX-Templates)
1. Complete your code changes in your forked branch
1. Push your branch up to github and create a pull request between your forked branch and dax templates main

## Proprietary Information
Any templates that are being submitted with any company specific or information deemed to be proprietary will not be accepted. 

Please, if you are submitting DAX templates and examples use generalized data and naming conventions.

## Got Ideas?

I'm sure you have some great ideas for improving this tool and other templates. Please put those thoughts inside the [Discussions Area](https://github.com/PowerBI-tips/DAX-Templates/discussions).

If you feel you have found a bug or an issue with the DAX templates or with the tools please submit your issues in the [Issues page](https://github.com/PowerBI-tips/DAX-Templates/issues). 

> **Note:** Before making an issue please do a search to see if there is a similar issue that already exists.

# Core Concepts

The idea of a DAX Template comes from the following example. Image you have a simple DAX formula like the following:
```
Sum of Sales = SUM( financial[Sales] )
```

From this simple measure we can infer that the Sum of Sales measure is creating a sum of the Sales Column from the Financial table. A Sum of a Column is a common occurrence when writing DAX.  

By deconstructing this DAX statement we can build common data model elements. 

One could parameterize the following items of the DAX statement:
1. Name of the Measure
2. The Column name ( using it's full Address 'table'[column] syntax )

Therefore we could rebuild this measure into a generalized template such as:

```
Parameter1 = Column Name = Sales
Parameter2 = Table Name = financial
```

Now, rewriting the DAX statement we can use these newly defined parameters.

```
Sum of Parameter1 = SUM( Parameter2[Parameter1] )

```

This statement has now been generalized and can be quickly added to any data model.  All the user would need to identify is the table name and the column name.  

## A More Complex Example

Now image a new example where one wants to create a measure, then use the measure to create a Summarized table.

The following DAX statements would be use to do the following:
1. Create a new measure that counts the number of rows in a table.
1. Creates a new DAX Summarized table where the original measure is used to produce a 

```
Count of Rows = COUNTROWS( 'TableName' )
NewTableName = SUMMARIZE( 'TableName', 'TableName'[Products], "Count of Observations", [Count of Rows] )
```

By using parameters these two DAX statements can be created into a parameterized template.

The parameters would be similar to the following.

```
Param1 = "Count of Rows"
Param2 = "TableName"
Param3 = "NewTableName"
Param4 = "Products"
Param5 = "Count of Observations"
```

Then the resultant two DAX statements would now be produced as the following:

```
Param1 = COUNTROWS( 'Param2' )
Param3 = SUMMARIZE( 'Param2', 'Param2'[Param4], "Param5", [Param1] )
```

From this you can imagine any number of different DAX measures that could be produced into templates. 