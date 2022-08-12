//%attributes = {}
If (False:C215)
	//Project Method Name:      Master_UseSS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 05:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($2; vSIS)
	C_LONGINT:C283(cSIS; vAny)
	C_POINTER:C301($_ptr_MasterTable; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Master_UseSS")
//Master_UseSS
$_ptr_MasterTable:=$1

If (vAny=0)
	If ((cSIS=1) & (vSIS=False:C215))
		USE SET:C118("Before")
		If (Count parameters:C259>=1)
			CREATE SET:C116($_ptr_MasterTable->; "Master")
		Else 
			Gen_Alert("This method (Master_UseSS has been modifiied and requires a parameter")
		End if 
		
	Else 
		
		If (Count parameters:C259>=1)
			
			If (Count parameters:C259>=2)
				If ($2)
					If (Records in selection:C76($_ptr_MasterTable->)>0)
						CREATE SET:C116($_ptr_MasterTable->; "Master")
					Else 
						CREATE EMPTY SET:C140($_ptr_MasterTable->; "Master")
					End if 
					CREATE SET:C116($_ptr_MasterTable->; "Master")
				Else 
					ALL RECORDS:C47($_ptr_MasterTable->)
					CREATE SET:C116($_ptr_MasterTable->; "Master")
				End if 
				
			Else 
				ALL RECORDS:C47($_ptr_MasterTable->)
				CREATE SET:C116($_ptr_MasterTable->; "Master")
			End if 
		Else 
			Gen_Alert("This method (Master_UseSS has been modifiied and requires a parameter")
		End if 
		
	End if 
Else 
	USE SET:C118("Master")
End if 
vAny:=1
ERR_MethodTrackerReturn("Master_UseSS"; $_t_oldMethodName)
