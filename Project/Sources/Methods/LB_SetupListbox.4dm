//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_SetupListbox
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2010/01/14 2:48 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ColumnCount; $_l_Index; $_l_NextColumn; $4)
	C_POINTER:C301($_ptr_HeadeButtonPointer; $1; $10; $11; $12; $13; $14; $15; $16; $17; $18)
	C_POINTER:C301($19; $20; $21; $22; $23; $24; $25; $26; $27; $28; $5)
	C_POINTER:C301($6; $7; $8; $9)
	C_TEXT:C284($_t_ButtonPrefix; $_t_ColumnName; $_t_ColumnPrefix; $_t_HeaderName; $_t_HeaderPrefix; $_t_OldMethodName; $2; $3; DB_t_Methodname)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("LB_SetupListbox")
DB_t_Methodname:=Current method name:C684
//This is the equivalant of calling
//AL_SetArraysName
// parameters: $1 = pointer to the listbox area
//                  $2 =

If (Count parameters:C259>=5)
	If (GenValidatePointer($1)) & (GenValidatePointer($5))
		If ($4=1)
			$_l_ColumnCount:=LISTBOX Get number of columns:C831($1->)
			If ($_l_ColumnCount>0)
				LISTBOX DELETE COLUMN:C830($1->; 1; $_l_ColumnCount)
			End if 
		End if 
		
		$_t_ColumnPrefix:=$2+"_COL"
		$_t_HeaderPrefix:=$2+"_HED"
		$_t_ButtonPrefix:=$3+"_BUT"
		$_l_NextColumn:=$4
		If ($4=-99)  //Count and append!!
			$_l_ColumnCount:=LISTBOX Get number of columns:C831($1->)
			$_l_NextColumn:=$_l_ColumnCount+1
		End if 
		For ($_l_Index; 5; Count parameters:C259)
			$_t_ColumnName:=$_t_ColumnPrefix+String:C10($_l_NextColumn)
			$_t_HeaderName:=$_t_HeaderPrefix+String:C10($_l_NextColumn)
			$_ptr_HeadeButtonPointer:=Get pointer:C304($_t_ButtonPrefix+String:C10($_l_NextColumn))
			
			LISTBOX INSERT COLUMN:C829($1->; $_l_NextColumn; $_t_ColumnName; ${$_l_Index}->; $_t_HeaderName; $_ptr_HeadeButtonPointer->)
			//BUTTON TEXT($_ptr_HeadeButtonPointer->;$_t_HeaderName)
			$_l_NextColumn:=$_l_NextColumn+1
			//End if
		End for 
	End if 
End if 
ERR_MethodTrackerReturn("LB_SetupListbox"; $_t_OldMethodName)