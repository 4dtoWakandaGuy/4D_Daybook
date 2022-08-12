//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_DeletionControl
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2012 15:16
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_OK)
	C_POINTER:C301($1)
	C_REAL:C285($0)
	C_TEXT:C284($_t_oldMethodName; $_t_Password; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_DeletionControl")
If (DB_GetOrganisation="Panacea Services Ltd")
	If (Count parameters:C259>=2)
		Case of 
			: (Table:C252($1)=Table:C252(->[ORDERS:24]))
				Gen_Confirm("You are about to delete order"+[ORDERS:24]Order_Code:3+".  To continue a password is required"; "OK"; "STOP")
				If (OK=1)
					Repeat 
						$_t_Password:=Gen_Request("Enter the password"; "")
						If ($_t_Password="Flapper") | ($_t_Password="Mossette") | ($_t_Password="DeleteControl")
							$_l_OK:=1
						Else 
							$_l_OK:=0
						End if 
						
					Until ($_l_OK=1)
					Gen_Alert("This deletion took place from "+$2)
				Else 
					$_l_OK:=0
					OK:=1
				End if 
			: (Table:C252($1)=Table:C252(->[ORDER_ITEMS:25]))
				Gen_Confirm("You are about to  delete an order item for"+[ORDER_ITEMS:25]Order_Code:1+" To continue a password is required"; "OK"; "STOP")
				If (OK=1)
					$0:=1
					Repeat 
						$_t_Password:=Gen_Request("Enter the password"; "")
						If ($_t_Password="Flapper") | ($_t_Password="Mossette") | ($_t_Password="DeleteControl")
							$_l_OK:=1
						Else 
							$_l_OK:=0
						End if 
						
					Until ($_l_OK=1)
					Gen_Alert("This deletion took place from "+$2)
				Else 
					$0:=0
					OK:=1
				End if 
				
		End case 
	End if 
Else 
	$_l_OK:=1
	$0:=1
End if 
ERR_MethodTrackerReturn("DB_DeletionControl"; $_t_oldMethodName)