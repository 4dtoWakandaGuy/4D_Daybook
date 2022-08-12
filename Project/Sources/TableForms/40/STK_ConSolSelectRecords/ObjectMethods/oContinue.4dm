If (False:C215)
	//object Name: [STOCK_MOVEMENTS]STK_ConSolSelectRecords.oContinue
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/05/2012 15:38
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_ab_Selected;0)
	C_BOOLEAN:C305(STK_bo_Continue)
	C_LONGINT:C283($_l_Index; $_l_Selected)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_MOVEMENTS].STK_ConSolSelectRecords.oContinue"; Form event code:C388)
$_l_Selected:=0
For ($_l_Index; 1; Size of array:C274(STK_ab_Selected))
	$_l_Selected:=$_l_Selected+Num:C11(STK_ab_Selected{$_l_Index})
End for 
If ($_l_Selected=0)
	Gen_Confirm("You did not select any records is that correct?"; "No"; "Yes")
	If (OK=0)
		OK:=1
		STK_bo_Continue:=True:C214
		ACCEPT:C269
	End if 
Else 
	ACCEPT:C269
End if 
ERR_MethodTrackerReturn("OBJ [STOCK_MOVEMENTS].STK_ConSolSelectRecords.oContinue"; $_t_oldMethodName)
