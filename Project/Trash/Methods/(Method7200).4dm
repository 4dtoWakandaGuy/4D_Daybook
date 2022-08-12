//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Method7200
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/04/2014 15:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(LB_l_FormulaTable;0)
	//ARRAY TEXT(LB_t_FormulaTableArray;0)
	C_BOOLEAN:C305(LB_bo_FormulasInited)
	C_LONGINT:C283($_l_TableRow; $_l_TableRow2; $_l_TableRow3; $1; $2)
	C_POINTER:C301($_ptr_ColumnArray; $_ptr_ResultsArray)
	C_TEXT:C284($_t_oldMethodName; $_t_TableArraySuffix; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Method7200")
ARRAY TEXT:C222(LB_t_FormulaTableArray; 0)
ARRAY LONGINT:C221(LB_l_FormulaTable; 0)
If (LB_bo_FormulasInited)
	$_l_TableRow:=Find in array:C230(LB_l_FormulaTable; $1)  //means we have to pass the table to this wrapper
	If ($_l_TableRow>0)
		$_t_TableArraySuffix:=LB_t_FormulaTableArray{$_l_TableRow}
	End if 
	$_ptr_ColumnArray:=Get pointer:C304("LB_al_FormulaColumns"+$_t_TableArraySuffix)  // Gives the column number Referred to
	$_l_TableRow2:=Find in array:C230($_ptr_ColumnArray->; $3)
	If ($_l_TableRow2>0)
		$_ptr_ResultsArray:=Get pointer:C304("LB_al_CoumnResults"+$3)
		If ($_l_TableRow3>0)
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Method7200"; $_t_oldMethodName)
