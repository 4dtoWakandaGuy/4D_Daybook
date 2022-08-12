//%attributes = {}
If (False:C215)
	//Project Method Name:      DBM_GetSQLData
	//------------------ Method Notes ------------------
	//Project will define the SOURCE IP the login and password..store them encrypted
	//The ProjectTables and dependencies.
	//the basic principle is we define a table..we enter a table name and get the table fields. We select the fields to get and store them.
	//that table must have and we must identify the time stamp field.-standard time stamp rule or something else.
	
	//we store Related tables..for every table A get related records in table b. The primary key in table A
	//we get and store the field names in that table and store them.
	//we map those fields to fields in Daybook and any 'tranlation' method(drop down of translation methods ) or macro to run on the field
	//an attached table data only gets 'committed' with the saving of the pirime table.
	//Fields may also include a 'lookup' other related table from which we may need to get data-that table also needs to be read defined and stored and the lookup value field in daybook to see if the record exists.
	
	//we define a post receipt action to take(such as invoice posting, updating related records etc
	//this will re-use the old EW tables which were for export projects.
	
	//------------------ Revision Control ----------------
	//Date Created: 13/10/2014 09:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ProjectID; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBM_GetSQLData")
$_l_ProjectID:=$1
If ($_l_ProjectID=0)
Else 
	//if hold down alt key then
End if 
ERR_MethodTrackerReturn("DBM_GetSQLData"; $_t_oldMethodName)