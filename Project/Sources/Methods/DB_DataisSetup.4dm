//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_DataisSetup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/03/2013 12:08
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_TableNumber; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_DataisSetup")

$0:=False:C215
If (Count parameters:C259>=1)
	$_l_TableNumber:=$1
	Case of 
		: ($_l_TableNumber=Table:C252(->[ACCOUNTS:32]))
			If (Records in table:C83([ACCOUNTS:32])=0)
				Gen_Confirm("There is no accounts data on this system would you like to set this up now?"; "Yes"; "No")
				If (OK=1)
					
				End if 
			Else 
				$0:=True:C214
			End if 
			
	End case 
End if 
ERR_MethodTrackerReturn("DB_DataisSetup"; $_t_oldMethodName)