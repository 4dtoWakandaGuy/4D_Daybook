//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_InAS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2010 23:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305(ORD_bo_IsRevision)
	C_LONGINT:C283(vAccessSwNo)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; $In; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SYS_t_AccessType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InAS")
If (Not:C34(ORD_bo_IsRevision))
	If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))
		//NG April 2004 removed reference to ◊screen
		//NG also removed reference to silver
		Menu_Record("Orders_InAS"; "Switch Access")
		//If (DB_GetModuleSetting(1)#5)`NG April 2004
		//If (◊Screen="13")
		vAccessSwNo:=0
		If (vAccessSwNo<4)
			If (In_ButtChkMan(->[ORDERS:24]; "3"))
				If (False:C215)
					//oh please we dont need to do this
				Else 
					//all we need to do is this
					$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
					DB_t_CurrentFormUsage:="AS"
					If (SYS_t_AccessType="Q")  // Was used to determine different screens-Aug 2006 no longer used for that
						SYS_t_AccessType:=""
					Else 
						SYS_t_AccessType:="Q"
					End if 
					DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
					Orders_InLPB
					Orders_InLPß("B")
				End if 
			End if 
			
		Else 
			Gen_Alert("The Switch Access Function can only be used 4 times before returning to a list "+"or to the menus"; "Cancel")
		End if 
		
	Else 
		Gen_Alert("This function can only be used to duplicate order items")
	End if 
	
Else 
	Gen_Alert("This function cannot be used when viewing previous revisions")
End if 
ERR_MethodTrackerReturn("Orders_InAS"; $_t_oldMethodName)