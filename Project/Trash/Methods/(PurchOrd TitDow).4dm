//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PurchOrd TitDow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	C_BOOLEAN:C305(<>StatesLoaded)
	C_LONGINT:C283($_l_CharacterPosition; $_l_InsertColumns; $_l_StateColumn)
	C_TEXT:C284($_t_oldMethodName; $_t_StateCode; $_t_StateName; $_t_TableSTR)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd TitDow")


If (Not:C34(<>StatesLoaded))
	States_Load
End if 

If ([PURCHASE_ORDERS:57]Record_State:19="")
	If ([PURCHASE_ORDERS:57]State:14>-1)
		If ([PURCHASE_ORDERS:57]Posted_Date:13=!00-00-00!)
			[PURCHASE_ORDERS:57]State:14:=-1
			PUR_SetFileState(-1)
			PurchOrd_State
		Else 
			Gen_Alert("You cannot unconfirm Posted Purchase Orders"; "Cancel")
		End if 
	End if 
	
Else 
	While (Semaphore:C143("$_l_InsertColumnsingStateCodes"))
		DelayTicks
	End while 
	If (Size of array:C274(<>SYS_at_RecStateCodes)<(Table:C252(->[PURCHASE_ORDERS:57])))
		$_l_InsertColumns:=(Table:C252(->[PURCHASE_ORDERS:57]))-(Size of array:C274(<>SYS_at_RecStateCodes))
		INSERT IN ARRAY:C227(<>SYS_at_RecStateCodes; Size of array:C274(<>SYS_at_RecStateCodes)+1; $_l_InsertColumns)
	End if 
	If (Size of array:C274(<>SYS_at_RecStateCodes{Table:C252(->[PURCHASE_ORDERS:57])})=0)
		States_Load2(Table:C252(->[PURCHASE_ORDERS:57]))
	End if 
	CLEAR SEMAPHORE:C144("$_l_InsertColumnsingStateCodes")
	$_t_TableSTR:=String:C10((Table:C252(->[PURCHASE_ORDERS:57])); "000")
	$_t_StateCode:=Substring:C12([PURCHASE_ORDERS:57]Record_State:19; Length:C16($_t_TableSTR)+1; Length:C16([PURCHASE_ORDERS:57]Record_State:19))
	$_l_StateColumn:=Find in array:C230(<>SYS_at_RecStateCodes{Table:C252(->[PURCHASE_ORDERS:57])}; $_t_StateCode)
	If ($_l_StateColumn>1)
		
		Case of 
			: ([PURCHASE_ORDERS:57]Posted_Date:13#!00-00-00!)
				$_l_StateColumn:=Find in array:C230(<>SYS_at_RecStateCodes{Table:C252(->[PURCHASE_ORDERS:57])}; $_t_StateCode)
				If ($_l_StateColumn>1)  //make sure not unconfirmed already
					$_t_StateName:=<>SYS_at_RecStateNames{Table:C252(->[PURCHASE_ORDERS:57])}{$_l_StateColumn-1}
					$_l_CharacterPosition:=Position:C15("Unconfirmed"; $_t_StateName)
					If ($_l_CharacterPosition>0)
						//no down grade
						Gen_Alert("You cannot unconfirm Posted Purchase Orders"; "Cancel")
					Else 
						PUR_SetFileState(-1)
						[PURCHASE_ORDERS:57]State:14:=0
						PurchOrd_State
					End if 
				End if 
			: ([PURCHASE_ORDERS:57]Posted_Date:13=!00-00-00!)
				PUR_SetFileState(-1)
				$_l_StateColumn:=Find in array:C230(<>SYS_at_RecStateCodes{Table:C252(->[PURCHASE_ORDERS:57])}; $_t_StateCode)
				If ($_l_StateColumn>1)  //make sure not unconfirmed already
					$_t_StateName:=<>SYS_at_RecStateNames{Table:C252(->[PURCHASE_ORDERS:57])}{$_l_StateColumn-1}
					$_l_CharacterPosition:=Position:C15("Unconfirmed"; $_t_StateName)
					If ($_l_CharacterPosition>0)
						//can down grade but also set the old type of state
						[PURCHASE_ORDERS:57]State:14:=-1
					End if 
				End if 
				PurchOrd_State
				
			Else 
				//will never go here now
				Gen_Alert("You cannot unconfirm Posted Purchase Orders"; "Cancel")
		End case 
	End if 
	
End if 
ERR_MethodTrackerReturn("PurchOrd TitDow"; $_t_oldMethodName)
