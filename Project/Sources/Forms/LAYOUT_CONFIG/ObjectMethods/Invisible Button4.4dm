If (False:C215)
	//object Name: Object Name:      LAYOUT_CONFIG.Invisible Button4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/10/2013 06:10
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(LAY_al_ColumnNumber;0)
	//ARRAY LONGINT(LAY_al_RecordNumbers;0)
	//ARRAY TEXT(LAY_at_ColumnTitle;0)
	C_BOOLEAN:C305(LAY_bo_RecordEdited; Lay_bo_SetupEdited)
	C_LONGINT:C283($_l_ColumnIndex; $_l_ColumnIndex2; $_l_ColumnNumber; $_l_LastNumber; $_l_MaxFormWidth; $_l_MaxWindowWidthPreference; $_l_offset; $_l_RecordNumber; $_L_RecordNumberRow; LAY_l_ConfigCancel; LAY_l_ConfigSave)
	C_TEXT:C284($_t_ColumnTitle; $_t_oldMethodName; DB_t_WindowFormPreference; LAY_t_MaxFormWidthText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ LAYOUT_CONFIG.Invisible Button4"; Form event code:C388)
If (LAY_bo_RecordEdited=True:C214)
	//do we want to save the current loaded first
	If ([LIST_LAYOUTS:96]Order:7#0)
		Gen_Confirm("The current loaded column definition has been edited do you want to save it first?"; "Yes"; "No")
		If (OK=1)
			Lay_bo_SetupEdited:=True:C214
			DB_SaveRecord(->[LIST_LAYOUTS:96])
		End if 
		LAY_bo_RecordEdited:=False:C215
		$_t_ColumnTitle:=[LIST_LAYOUTS:96]Title:4
		$_l_ColumnNumber:=[LIST_LAYOUTS:96]Order:7
		$_l_RecordNumber:=Record number:C243([LIST_LAYOUTS:96])
		$_L_RecordNumberRow:=Find in array:C230(LAY_al_RecordNumbers; $_l_RecordNumber)
		If ($_L_RecordNumberRow<0)
			$_L_RecordNumberRow:=Find in array:C230(LAY_al_RecordNumbers; 0)
		End if 
		LAY_al_ColumnNumber{$_L_RecordNumberRow}:=$_l_ColumnNumber
		LAY_at_ColumnTitle{$_L_RecordNumberRow}:=$_t_ColumnTitle
		LAY_al_RecordNumbers{$_L_RecordNumberRow}:=$_l_RecordNumber
		SORT ARRAY:C229(LAY_al_ColumnNumber; LAY_at_ColumnTitle; LAY_al_RecordNumbers)
		$_l_LastNumber:=0
		For ($_l_ColumnIndex; 1; Size of array:C274(LAY_al_ColumnNumber))
			If (LAY_al_RecordNumbers{$_l_ColumnIndex}=0)
				LAY_al_RecordNumbers{$_l_ColumnIndex}:=1
			End if 
			If (LAY_al_ColumnNumber{$_l_ColumnIndex}=$_l_LastNumber)
				//its a clash
				If ($_l_RecordNumber#LAY_al_RecordNumbers{$_l_ColumnIndex})
					LAY_al_ColumnNumber{$_l_ColumnIndex}:=LAY_al_ColumnNumber{$_l_ColumnIndex}+1
					GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex})
					[LIST_LAYOUTS:96]Order:7:=LAY_al_RecordNumbers{$_l_ColumnIndex}
					DB_SaveRecord(->[LIST_LAYOUTS:96])
				Else 
					$_l_offset:=0
					For ($_l_ColumnIndex2; $_l_ColumnIndex; 1; -1)
						If (LAY_al_ColumnNumber{$_l_ColumnIndex2}=LAY_al_ColumnNumber{$_l_ColumnIndex})
							LAY_al_ColumnNumber{$_l_ColumnIndex2}:=LAY_al_ColumnNumber{$_l_ColumnIndex}+$_l_offset
							GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex})
							[LIST_LAYOUTS:96]Order:7:=LAY_al_RecordNumbers{$_l_ColumnIndex}
							DB_SaveRecord(->[LIST_LAYOUTS:96])
						End if 
						$_l_offset:=$_l_offset+1
					End for 
				End if 
			End if 
			$_l_LastNumber:=LAY_al_ColumnNumber{$_l_ColumnIndex}
		End for 
		SORT ARRAY:C229(LAY_al_ColumnNumber; LAY_at_ColumnTitle; LAY_al_RecordNumbers)
		$_l_ColumnNumber:=0
		For ($_l_ColumnIndex; 1; Size of array:C274(LAY_al_ColumnNumber))
			$_l_ColumnNumber:=$_l_ColumnIndex
			If (LAY_al_ColumnNumber{$_l_ColumnIndex}#$_l_ColumnNumber)
				GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex})
				LAY_al_ColumnNumber{$_l_ColumnIndex}:=$_l_ColumnNumber
				[LIST_LAYOUTS:96]Order:7:=$_l_ColumnNumber
				DB_SaveRecord(->[LIST_LAYOUTS:96])
				
			End if 
		End for 
		LAY_bo_RecordEdited:=False:C215
		OBJECT SET VISIBLE:C603(LAY_l_ConfigSave; False:C215)
		OBJECT SET VISIBLE:C603(LAY_l_ConfigCancel; False:C215)
		//`
	End if   //````
	
	If (LAY_t_MaxFormWidthText#"") & (DB_t_WindowFormPreference#"")
		If (LAY_t_MaxFormWidthText#"Not Set")
			$_l_MaxFormWidth:=Num:C11(LAY_t_MaxFormWidthText)
			If ($_l_MaxFormWidth>0)
				$_l_MaxWindowWidthPreference:=DB_GetUserWidthPreference(True:C214; DB_t_WindowFormPreference; $_l_MaxFormWidth)
			End if 
			
		End if 
	End if 
End if 
ACCEPT:C269
Transact_End
USE NAMED SELECTION:C332("Whenwecamein")
ERR_MethodTrackerReturn("OBJ LAYOUT_CONFIG.Invisible Button4"; $_t_oldMethodName)