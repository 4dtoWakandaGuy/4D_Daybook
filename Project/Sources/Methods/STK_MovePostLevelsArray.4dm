//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_MovePostLevelsArray
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/04/2010 11:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(STK_ar_AllocatedCost;0)
	//ARRAY REAL(STK_ar_LevelAllocated;0)
	//ARRAY REAL(STK_ar_LevelFree;0)
	//ARRAY REAL(STK_ar_LevelFreeCost;0)
	//ARRAY TEXT(STK_at_LevelsProductCode;0)
	//ARRAY TEXT(STK_at_LevelstoPost;0)
	C_BOOLEAN:C305(STK_bo_LevelsArraysInited)
	C_LONGINT:C283($_l_SizeofArray)
	C_REAL:C285($6; $7; $8; $9)
	C_TEXT:C284($_t_oldMethodName; $_t_StockUniqueReference; $1; $2; $3; $4; $5)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_MovePostLevelsArray")


If (Not:C34(STK_bo_LevelsArraysInited))
	ARRAY TEXT:C222(STK_at_LevelsProductCode; 0)
	ARRAY TEXT:C222(STK_at_LevelstoPost; 0)
	ARRAY REAL:C219(STK_ar_LevelFree; 0)
	ARRAY REAL:C219(STK_ar_LevelFreeCost; 0)
	ARRAY REAL:C219(STK_ar_LevelAllocated; 0)
	ARRAY REAL:C219(STK_ar_AllocatedCost; 0)
	STK_bo_LevelsArraysInited:=True:C214
End if 
$_t_StockUniqueReference:=STOCK_BuildUnique($1; $2; $3; $4; $5)
$_l_SizeofArray:=Find in array:C230(STK_at_LevelstoPost; $_t_StockUniqueReference)
If ($_l_SizeofArray<0)
	APPEND TO ARRAY:C911(STK_at_LevelsProductCode; $1)
	
	APPEND TO ARRAY:C911(STK_at_LevelstoPost; $_t_StockUniqueReference)
	APPEND TO ARRAY:C911(STK_ar_LevelFree; 0)
	APPEND TO ARRAY:C911(STK_ar_LevelFreeCost; 0)
	APPEND TO ARRAY:C911(STK_ar_LevelAllocated; 0)
	APPEND TO ARRAY:C911(STK_ar_AllocatedCost; 0)
	$_l_SizeofArray:=Size of array:C274(STK_ar_AllocatedCost)
	
End if 
If ($7=0)
	STK_ar_LevelFree{$_l_SizeofArray}:=Round:C94((STK_ar_LevelFree{$_l_SizeofArray}+(Abs:C99($8)*$6)); 2)
	If ($6=1)
		STK_ar_LevelFreeCost{$_l_SizeofArray}:=Round:C94((STK_ar_LevelFreeCost{$_l_SizeofArray}+$9); 2)
	Else 
		STK_ar_LevelFreeCost{$_l_SizeofArray}:=Round:C94((STK_ar_LevelFreeCost{$_l_SizeofArray}-$9); 2)
		
	End if 
Else 
	STK_ar_LevelAllocated{$_l_SizeofArray}:=Round:C94((STK_ar_LevelAllocated{$_l_SizeofArray}+(Abs:C99($8)*$6)); 2)
	If ($6=1)
		STK_ar_AllocatedCost{$_l_SizeofArray}:=Round:C94((STK_ar_AllocatedCost{$_l_SizeofArray}+$9); 2)
	Else 
		STK_ar_AllocatedCost{$_l_SizeofArray}:=Round:C94((STK_ar_AllocatedCost{$_l_SizeofArray}-$9); 2)
	End if 
	
End if 
ERR_MethodTrackerReturn("STK_MovePostLevelsArray"; $_t_oldMethodName)