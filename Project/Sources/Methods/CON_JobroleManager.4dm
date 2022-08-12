//%attributes = {}
If (False:C215)
	//Project Method Name:      CON_JobroleManager
	//------------------ Method Notes ------------------
	//NG april 2004
	//this method displays a dialog in which the roles and rates of a contact can be set
	//the contact ID is passed in $1
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(CON_ar_CostRate;0)
	//ARRAY REAL(CON_ar_SalesRate;0)
	//ARRAY TEXT(CON_at_JobRoles;0)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CON_JobroleManager")
If ([CONTACTS:1]x_ID:33#$1)
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=$1)
End if 
ARRAY TEXT:C222(CON_at_JobRoles; 0)  //to hold the roles
ARRAY REAL:C219(CON_ar_SalesRate; 0)  //to hold the Sales Rate
ARRAY REAL:C219(CON_ar_CostRate; 0)  //to hold the Cost Rate
CON_GetCharges(->CON_at_JobRoles; ->CON_ar_SalesRate; ->CON_ar_CostRate)
ERR_MethodTrackerReturn("CON_JobroleManager"; $_t_oldMethodName)