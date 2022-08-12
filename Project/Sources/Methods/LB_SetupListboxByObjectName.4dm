//%attributes = {}

If (False:C215)
	//Database Method Name:      LB_SetupListboxByObjectName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/08/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ColumnCount; $_l_CountParameters; $_l_FirstColumn; $_l_Index; $_l_NextColumn; $4)
	C_POINTER:C301($_ptr_HeadeButtonPointer)
	C_TEXT:C284($_t_ButtonPrefix; $_t_ButtonPrefixes; $_t_ColumnName; $_t_ColumnPrefix; $_t_HeaderName; $_t_HeaderPrefix; $_t_ObjectName; $_t_OldMethodName; $_t_Prefixes; $1; $2)
	C_TEXT:C284($3; DB_t_Methodname)
End if 

//Code Starts Here
$_t_OldMethodName:=ERR_MethodTracker("LB_SetupListboxByObjectName")
DB_t_Methodname:=Current method name:C684
//This is the equivalant of calling
//AL_SetArraysName
// parameters: $1 = pointer to the listbox area
$_t_ObjectName:=$1
$_t_Prefixes:=$2
$_t_ButtonPrefixes:=$3
$_l_FirstColumn:=$4
$_l_CountParameters:=Count parameters:C259

//                  $_t_Prefixes =

If (Count parameters:C259>=5)
	If ($_l_FirstColumn=1)
		$_l_ColumnCount:=LISTBOX Get number of columns:C831(*; $_t_ObjectName)
		If ($_l_ColumnCount>0)
			LISTBOX DELETE COLUMN:C830(*; $_t_ObjectName; 1; $_l_ColumnCount)
		End if 
	End if 
	
	$_t_ColumnPrefix:=$_t_Prefixes+"_COL"
	$_t_HeaderPrefix:=$_t_Prefixes+"_HED"
	$_t_ButtonPrefix:=$_t_ButtonPrefixes+"_BUT"
	$_l_NextColumn:=$_l_FirstColumn
	If ($_l_FirstColumn=-99)  //Count and append!!
		$_l_ColumnCount:=LISTBOX Get number of columns:C831(*; $_t_ObjectName)
		$_l_NextColumn:=$_l_ColumnCount+1
	End if 
	For ($_l_Index; 5; $_l_CountParameters)
		$_t_ColumnName:=$_t_ColumnPrefix+String:C10($_l_NextColumn)
		$_t_HeaderName:=$_t_HeaderPrefix+String:C10($_l_NextColumn)
		$_ptr_HeadeButtonPointer:=Get pointer:C304($_t_ButtonPrefix+String:C10($_l_NextColumn))
		LISTBOX INSERT COLUMN:C829(*; $_t_ObjectName; $_l_NextColumn; $_t_ColumnName; ${$_l_Index}->; $_t_HeaderName; $_ptr_HeadeButtonPointer->)
		$_l_NextColumn:=$_l_NextColumn+1
	End for 
End if 
ERR_MethodTrackerReturn("LB_SetupListboxByObjectName"; $_t_oldMethodName)