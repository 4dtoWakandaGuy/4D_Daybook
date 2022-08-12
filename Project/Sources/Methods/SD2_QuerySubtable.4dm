//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_QuerySubtable
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2009 13:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1; $2)
	C_TEXT:C284($_t_oldMethodName; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_QuerySubtable")
//This specialist method will allow diary records to be related to a subtable record-this is used to search for the subtable records and return a selecition of the parent records
If (Count parameters:C259>=4)
	Case of 
		: ($1=Table:C252(->[ACCOUNTS:32]))
			//Case of
			//: ($2=Field(->[ACCOUNTS]ANALYSES))
			//NG January 2006 Subtable dead
			//Case of
			//: ($3="Analysis Code")
			//End case
			//: ($2=Field(->[ACCOUNTS]LAYERS))
			//'NG January 2006 Subtable dead
			//Case of
			//:` ($3="layer  Code")
			//End case
			//End case
			
		: ($1=Table:C252(->[COMPANIES:2]))
			//Case of
			//: ($2=Field(->[COMPANIES]FURTHERS))
			// field now dead
			
			//Case of
			//: ($3="Further Code")
			//End case
			//End case
		: ($1=Table:C252(->[CONTACTS:1]))
			//Case of
			//: ($2=Field(->[CONTACTS]COMPANIES))
			//Case of
			//: ($3="Address Type")
			//: ($3="Company Code")
			//End case
			
			//Case of
			//: ($3="Further Code")
			//End case
			
			//End case
		: ($1=Table:C252(->[CONTRACTS:17]))
			//Case of
			//: ($2=Field(->[CONTRACTS]CONTACTS))
			//Case of
			//: ($3="Contact Code")
			//End case
			
			//End case
			//Etc
			
	End case 
End if 
ERR_MethodTrackerReturn("SD2_QuerySubtable"; $_t_oldMethodName)