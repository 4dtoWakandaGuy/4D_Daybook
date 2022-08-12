//%attributes = {}
If (False:C215)
	//Project Method Name:      CON_BuildContactName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CON_BuildContactName")
$0:=""
If (Count parameters:C259=0)
	
	If ([CONTACTS:1]Title:3#"")
		$0:=[CONTACTS:1]Title:3+" "
	Else 
		If (Application type:C494#4D Server:K5:6)
			If ([CONTACTS:1]Contact_Name:31#Old:C35([CONTACTS:1]Contact_Name:31))
				// If (Count parameters=0)
				//  Gen_Alert ("You must enter a Title for this person";"OK")
				// Else
				//  If ($1)
				//    Gen_Alert ("You must enter a Title for this person";"OK")
				
				//   End if
				// End if
				
			End if 
		End if 
		
		
	End if 
	If ([CONTACTS:1]Forename:4#"")
		If ([CONTACTS:1]Surname:5#"")
			$0:=$0+[CONTACTS:1]Forename:4+" "
		Else 
			$0:=$0+[CONTACTS:1]Forename:4
		End if 
		
	End if 
	$0:=$0+[CONTACTS:1]Surname:5
Else 
	
	If ($1#"")
		$0:=$1+" "
	Else 
		
	End if 
	If ($2#"")
		If ($2#"")
			If ($3#"")
				$0:=$0+$2+" "
			Else 
				$0:=$0+$2
			End if 
			
		Else 
			$0:=$0+$2
		End if 
		
	End if 
	$0:=$0+$3
End if 
ERR_MethodTrackerReturn("CON_BuildContactName"; $_t_oldMethodName)