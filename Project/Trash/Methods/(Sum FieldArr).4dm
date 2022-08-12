//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sum FieldArr
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
	ARRAY INTEGER:C220($_ai_Sum; 0)
	ARRAY LONGINT:C221($_al_Sum; 0)
	ARRAY REAL:C219($_ar_Sum; 0)
	C_LONGINT:C283($_l_DataType; $_l_Index; $_l_SizeofArray)
	C_POINTER:C301($1)
	C_REAL:C285($0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sum FieldArr")

$0:=0
$_l_DataType:=Type:C295($1->)
Case of 
	: ($_l_DataType=1)
		ARRAY REAL:C219($_ar_Sum; 0)
		SELECTION TO ARRAY:C260($1->; $_ar_Sum)
		$_l_SizeofArray:=Size of array:C274($_ar_Sum)
		$0:=Sum:C1($_ar_Sum)
		
	: ($_l_DataType=8)
		ARRAY INTEGER:C220($_ai_Sum; 0)
		SELECTION TO ARRAY:C260($1->; $_ai_Sum)
		$_l_SizeofArray:=Size of array:C274($_ai_Sum)
		$0:=Sum:C1($_ai_Sum)
		
	: (($_l_DataType=9) | ($_l_DataType=11))
		ARRAY LONGINT:C221($_al_Sum; 0)
		SELECTION TO ARRAY:C260($1->; $_al_Sum)
		$_l_SizeofArray:=Size of array:C274($_al_Sum)
		$0:=Sum:C1($_al_Sum)
		
End case 
ERR_MethodTrackerReturn("Sum FieldArr"; $_t_oldMethodName)
