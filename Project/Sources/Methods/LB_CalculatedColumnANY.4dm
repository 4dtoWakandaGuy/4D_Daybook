//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_CalculatedColumnANY
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/11/2014 16:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_Formula)
	C_BOOLEAN:C305($_bo_addtoArrays; $_bo_Boolean; $_bo_Calculate; LB_FM_COLUMCalcsInited)
	C_DATE:C307($_d_Date)
	C_LONGINT:C283($_l_arraySIze; $_l_CalcColumn; $_l_FormEvent; $_l_Index; $_l_KeyFieldColumn; $_l_Longint; $_l_TextPosition; $0; $5)
	C_POINTER:C301($_ptr_ActiveArrays; $_ptr_array; $_ptr_ArrayReferences; $_ptr_BoolColumn; $_ptr_DateColumn; $_ptr_FilledIndex; $_ptr_Index; $_ptr_KeyField; $_ptr_ListboxSetup; $_ptr_LongColumn; $_ptr_OtherIndex)
	C_POINTER:C301($_ptr_RealColumn; $_ptr_TextColumn; $6)
	C_REAL:C285($_r_Real)
	C_TEXT:C284($_t_AfterFormula; $_t_Base64Blob; $_t_ColumnsDoneThisRow; $_t_Formula; $_t_Macro; $_t_MacroName; $_t_oldMethodName; $_t_ScriptType; $_t_SettingsArrayName; $_t_Text; $1)
	C_TEXT:C284($2; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_CalculatedColumnANY")
If (Count parameters:C259>=4)
	$_t_SettingsArrayName:=$1
	$_t_Base64Blob:=$4
	
	BASE64 DECODE:C896($_t_Base64Blob; $_blb_Formula)
	$_t_Formula:=BLOB to text:C555($_blb_Formula; 0)
	If (Not:C34(LB_FM_COLUMCalcsInited))
		LB_InitCacheArrays
	End if 
	$_ptr_ListboxSetup:=Get pointer:C304($1)
	
	$_ptr_KeyField:=$_ptr_ListboxSetup->{8}
	$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
	//$Arraygroup:=$_ptr_ArrayReferences->{1}
	//$type2:=Type($_ptr_KeyField->)
	Case of 
		: ($5=Is date:K8:7)
			If (Num:C11($2)>10)
				$_ptr_DateColumn:=Get pointer:C304("LB_ad_FMResult_"+$3+"_"+($2))
			Else 
				$_ptr_DateColumn:=Get pointer:C304("LB_ad_FMResult_"+$3+"_0"+($2))
				
			End if 
		: ($5=Is boolean:K8:9)
			If (Num:C11($2)>10)
				
				$_ptr_BoolColumn:=Get pointer:C304("LB_aB_FMResult_"+$3+"_"+$2)
			Else 
				$_ptr_BoolColumn:=Get pointer:C304("LB_aB_FMResult_"+$3+"_0"+$2)
				
			End if 
		: ($5=Is longint:K8:6)
			If (Num:C11($2)>10)
				$_ptr_LongColumn:=Get pointer:C304("LB_al_FMResult_"+$3+"_"+($2))
			Else 
				$_ptr_LongColumn:=Get pointer:C304("LB_al_FMResult_"+$3+"_0"+($2))
			End if 
		: ($5=Is real:K8:4)
			If (Num:C11($2)>10)
				$_ptr_RealColumn:=Get pointer:C304("LB_ar_FMResult_"+$3+"_"+$2)
			Else 
				$_ptr_RealColumn:=Get pointer:C304("LB_ar_FMResult_"+$3+"_0"+$2)
			End if 
			
		: ($5=Is text:K8:3)
			If (Num:C11($2)>10)
				
				$_ptr_TextColumn:=Get pointer:C304("LB_at_FMResult_"+$3+"_"+($2))
			Else 
				$_ptr_TextColumn:=Get pointer:C304("LB_at_FMResult_"+$3+"_0"+($2))
				//$_ptr_TextColumn
			End if 
			
		: ($5=Is picture:K8:10)
	End case 
	
	
	If (Type:C295($_ptr_KeyField->)=Is longint:K8:6)
		$_ptr_Index:=Get pointer:C304("LB_al_Index_"+$3)
		
		$_ptr_OtherIndex:=Get pointer:C304("LB_at_Index_"+$3)
	Else 
		$_ptr_Index:=Get pointer:C304("LB_at_Index_"+$3)
		$_ptr_OtherIndex:=Get pointer:C304("LB_al_Index_"+$3)
	End if 
	$_ptr_FilledIndex:=Get pointer:C304("LB_at_ColumnNumsCalculated_"+$3)  //string of the columns calculated for this row..
	$_ptr_ActiveArrays:=Get pointer:C304("LB_at_ActiveArrays_"+$3)
	$_l_FormEvent:=Form event code:C388
	$_l_KeyFieldColumn:=Find in array:C230($_ptr_Index->; $_ptr_KeyField->)
	$_bo_addtoArrays:=False:C215
	$_bo_Calculate:=False:C215
	If ($_l_KeyFieldColumn<0)
		$_bo_addtoArrays:=True:C214
		$_bo_Calculate:=True:C214
	Else 
		$_t_ColumnsDoneThisRow:=$_ptr_FilledIndex->{$_l_KeyFieldColumn}
		$_l_TextPosition:=Position:C15($2+","; $_t_ColumnsDoneThisRow)
		If ($_l_TextPosition=0)
			$_bo_Calculate:=True:C214
		End if 
		
	End if 
	Case of 
		: ($5=Is date:K8:7)
			$_l_CalcColumn:=Find in array:C230($_ptr_ActiveArrays->; $_ptr_DateColumn)
			If ($_l_CalcColumn<0)
				If (Size of array:C274($_ptr_ActiveArrays->)>0)
					$_ptr_array:=$_ptr_ActiveArrays->{1}
					$_l_arraySIze:=Size of array:C274($_ptr_array->)
					ARRAY DATE:C224($_ptr_DateColumn->; $_l_arraySIze)
				End if 
				APPEND TO ARRAY:C911($_ptr_ActiveArrays->; $_ptr_DateColumn)
			End if 
		: ($5=Is boolean:K8:9)
			$_l_CalcColumn:=Find in array:C230($_ptr_ActiveArrays->; $_ptr_BoolColumn)
			If ($_l_CalcColumn<0)
				If (Size of array:C274($_ptr_ActiveArrays->)>0)
					$_ptr_array:=$_ptr_ActiveArrays->{1}
					$_l_arraySIze:=Size of array:C274($_ptr_array->)
					ARRAY BOOLEAN:C223($_ptr_BoolColumn->; $_l_arraySIze)
				End if 
				APPEND TO ARRAY:C911($_ptr_ActiveArrays->; $_ptr_BoolColumn)
			End if 
		: ($5=Is longint:K8:6)
			$_l_CalcColumn:=Find in array:C230($_ptr_ActiveArrays->; $_ptr_LongColumn)
			If ($_l_CalcColumn<0)
				If (Size of array:C274($_ptr_ActiveArrays->)>0)
					$_ptr_array:=$_ptr_ActiveArrays->{1}
					$_l_arraySIze:=Size of array:C274($_ptr_array->)
					ARRAY LONGINT:C221($_ptr_LongColumn->; $_l_arraySIze)
				End if 
				APPEND TO ARRAY:C911($_ptr_ActiveArrays->; $_ptr_LongColumn)
			End if 
		: ($5=Is real:K8:4)
			$_l_CalcColumn:=Find in array:C230($_ptr_ActiveArrays->; $_ptr_RealColumn)
			If ($_l_CalcColumn<0)
				If (Size of array:C274($_ptr_ActiveArrays->)>0)
					$_ptr_array:=$_ptr_ActiveArrays->{1}
					$_l_arraySIze:=Size of array:C274($_ptr_array->)
					ARRAY REAL:C219($_ptr_RealColumn->; $_l_arraySIze)
				End if 
				APPEND TO ARRAY:C911($_ptr_ActiveArrays->; $_ptr_RealColumn)
			End if 
		: ($5=Is text:K8:3)
			$_l_CalcColumn:=Find in array:C230($_ptr_ActiveArrays->; $_ptr_TextColumn)
			If ($_l_CalcColumn<0)
				If (Size of array:C274($_ptr_ActiveArrays->)>0)
					$_ptr_array:=$_ptr_ActiveArrays->{1}
					$_l_arraySIze:=Size of array:C274($_ptr_array->)
					ARRAY TEXT:C222($_ptr_TextColumn->; $_l_arraySIze)
				End if 
				APPEND TO ARRAY:C911($_ptr_ActiveArrays->; $_ptr_TextColumn)
			End if 
		: ($5=Is picture:K8:10)
	End case 
	//($_l_FormEvent=On Data Change) | ($_l_FormEvent=On Load)
	If ($_l_KeyFieldColumn<0) | ($_bo_Calculate)
		
		$_l_TextPosition:=Position:C15("Macro "; $_t_Formula)
		$_t_AfterFormula:=Substring:C12($_t_Formula; $_l_TextPosition)
		$_l_TextPosition:=Position:C15("("; $_t_AfterFormula)
		$_t_ScriptType:=Substring:C12($_t_AfterFormula; 1; $_l_TextPosition-1)
		$_t_Macro:=Substring:C12($_t_AfterFormula; $_l_TextPosition+2)
		$_l_TextPosition:=Position:C15(Char:C90(34); $_t_Macro)
		$_t_MacroName:=Substring:C12($_t_Macro; 1; $_l_TextPosition-1)
		Case of 
			: ($5=Is date:K8:7)
				Case of 
					: ($_t_ScriptType="Macro_ResultTxt@")
						
						$_d_Date:=Date:C102(Macro_ResultTxt($_t_MacroName))
						
					: ($_t_ScriptType="Macro_Result@")
						$_d_Date:=!00-00-00!+(Macro_Result($_t_MacroName))
					: ($_t_ScriptType="Macro_Result_date@")
						$_d_Date:=(Macro_Result_Date($_t_MacroName))
					Else 
						EXECUTE FORMULA:C63("$_d_Date:="+$_t_Formula)
				End case 
				
			: ($5=Is boolean:K8:9)
				Case of 
					: ($_t_ScriptType="Macro_ResultTxt@")
						
						$_bo_Boolean:=((Num:C11(Macro_ResultTxt($_t_MacroName))=1)) | ((Macro_ResultTxt($_t_MacroName)="TRUE"))
						
						//
						// |
						
						
						
					: ($_t_ScriptType="Macro_Result@")
						$_bo_Boolean:=((Macro_Result($_t_MacroName))=1)
						
					: ($_t_ScriptType="Macro_Result_bool@")
						$_bo_Boolean:=(Macro_Result_Boolean($_t_MacroName))
					Else 
						EXECUTE FORMULA:C63("$_bo_Boolean:="+$_t_Formula)
				End case 
				
			: ($5=Is longint:K8:6)
				Case of 
					: ($_t_ScriptType="Macro_ResultTxt@")
						$_l_Longint:=(Num:C11(Macro_ResultTxt($_t_MacroName)))
					: ($_t_ScriptType="Macro_Result@")
						$_l_Longint:=((Macro_Result($_t_MacroName)))
					: ($_t_ScriptType="Macro_Result_long@")
						$_l_Longint:=(Macro_Result_Long($_t_MacroName))
					Else 
						EXECUTE FORMULA:C63("$_l_Longint:="+$_t_Base64Blob)
				End case 
				
			: ($5=Is real:K8:4)
				Case of 
					: ($_t_ScriptType="Macro_ResultTxt@")
						//ORD_t_Fault:=$_t_MacroName
						$_r_Real:=Num:C11(Macro_ResultTxt($_t_MacroName))
						//ORD_t_Fault:=vText
					: ($_t_ScriptType="Macro_Result@")
						//ORD_t_Fault:="Macro_Result"
						$_r_Real:=(Macro_Result($_t_MacroName))
					: ($_t_ScriptType="Macro_Result_Real@")
						$_r_Real:=(Macro_Result_Real($_t_MacroName))
					Else 
						$_r_Real:=9999
				End case 
				
			: ($5=Is text:K8:3)
				Case of 
					: ($_t_ScriptType="Macro_ResultTxt@")
						//ORD_t_Fault:=$_t_MacroName
						$_t_Text:=((Macro_ResultTxt($_t_MacroName)))
						
						
					: ($_t_ScriptType="Macro_Result@")
						$_t_Text:=String:C10((Macro_Result($_t_MacroName)))
						//ORD_t_Fault:="V"
					: ($_t_ScriptType="Macro_Result_text@")
						//ORD_t_Fault:="C"
						$_t_Text:=(Macro_Result_Text($_t_MacroName))
					Else 
						//ORD_t_Fault:="D"
						EXECUTE FORMULA:C63("$_t_Text:="+$_t_Base64Blob)
				End case 
				
			: ($5=Is picture:K8:10)
		End case 
		
		
		If ($_l_KeyFieldColumn<0)
			If (Type:C295($_ptr_KeyField->)=Is longint:K8:6)
				APPEND TO ARRAY:C911($_ptr_OtherIndex->; "")
				APPEND TO ARRAY:C911($_ptr_Index->; $_ptr_KeyField->)
			Else 
				APPEND TO ARRAY:C911($_ptr_OtherIndex->; 0)
				APPEND TO ARRAY:C911($_ptr_Index->; $_ptr_KeyField->)
			End if 
			APPEND TO ARRAY:C911($_ptr_FilledIndex->; "")
			
			For ($_l_Index; 1; Size of array:C274($_ptr_ActiveArrays->))
				$_ptr_array:=$_ptr_ActiveArrays->{$_l_Index}
				$_l_arraySIze:=Size of array:C274($_ptr_array->)
				INSERT IN ARRAY:C227($_ptr_array->; $_l_arraySIze+1; 1)
			End for 
			If ($_bo_Calculate)
				$_ptr_FilledIndex->{Size of array:C274($_ptr_FilledIndex->)}:=$_ptr_FilledIndex->{Size of array:C274($_ptr_FilledIndex->)}+($2)+","
			End if 
			Case of 
				: ($5=Is date:K8:7)
					$_ptr_DateColumn->{Size of array:C274($_ptr_DateColumn->)}:=$_d_Date
				: ($5=Is boolean:K8:9)
					$_ptr_BoolColumn->{Size of array:C274($_ptr_BoolColumn->)}:=$_bo_Boolean
					
				: ($5=Is longint:K8:6)
					$_ptr_LongColumn->{Size of array:C274($_ptr_LongColumn->)}:=$_l_Longint
				: ($5=Is real:K8:4)
					$_ptr_RealColumn->{Size of array:C274($_ptr_RealColumn->)}:=$_r_Real
					
				: ($5=Is text:K8:3)
					$_ptr_TextColumn->{Size of array:C274($_ptr_RealColumn->)}:=$_t_Text
				: ($5=Is picture:K8:10)
			End case 
			
			
		Else 
			Case of 
				: ($5=Is date:K8:7)
					$_ptr_DateColumn->{$_l_KeyFieldColumn}:=$_d_Date
				: ($5=Is boolean:K8:9)
					$_ptr_BoolColumn->{$_l_KeyFieldColumn}:=$_bo_Boolean
				: ($5=Is longint:K8:6)
					$_ptr_LongColumn->{$_l_KeyFieldColumn}:=$_l_Longint
				: ($5=Is real:K8:4)
					$_ptr_RealColumn->{$_l_KeyFieldColumn}:=$_r_Real
					
				: ($5=Is text:K8:3)
					$_ptr_TextColumn->{$_l_KeyFieldColumn}:=$_t_Text
				: ($5=Is picture:K8:10)
			End case 
			If ($_bo_Calculate)
				$_ptr_FilledIndex->{$_l_KeyFieldColumn}:=$_ptr_FilledIndex->{$_l_KeyFieldColumn}+($2)+","
			End if 
			
		End if 
		Case of 
			: ($5=Is date:K8:7)
				$6->:=$_d_Date
			: ($5=Is boolean:K8:9)
				$6->:=$_bo_Boolean
			: ($5=Is longint:K8:6)
				$6->:=$_l_Longint
			: ($5=Is real:K8:4)
				$6->:=$_r_Real
			: ($5=Is text:K8:3)
				$6->:=$_t_Text
			: ($5=Is picture:K8:10)
		End case 
		
	Else 
		Case of 
			: ($5=Is date:K8:7)
				$6->:=$_ptr_DateColumn->{$_l_KeyFieldColumn}
				
			: ($5=Is boolean:K8:9)
				$6->:=$_ptr_BoolColumn->{$_l_KeyFieldColumn}
			: ($5=Is longint:K8:6)
				$6->:=$_ptr_LongColumn->{$_l_KeyFieldColumn}
			: ($5=Is real:K8:4)
				$6->:=$_ptr_RealColumn->{$_l_KeyFieldColumn}
			: ($5=Is text:K8:3)
				$6->:=$_ptr_TextColumn->{$_l_KeyFieldColumn}
			: ($5=Is picture:K8:10)
		End case 
		
	End if 
End if 
ERR_MethodTrackerReturn("LB_CalculatedColumnANY"; $_t_oldMethodName)