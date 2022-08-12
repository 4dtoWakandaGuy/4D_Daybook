//%attributes = {}
If (False:C215)
	//Project Method Name:      SMC_SaveMacroInfo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 11:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(SMC_ad_LastModifiedDates;0)
	//ARRAY TEXT(SMC_at_LastEditedPersons;0)
	//ARRAY TEXT(SMC_at_LastModifiedTexts;0)
	C_LONGINT:C283($_l_FIeldIndex; $_l_offset; $_l_TableNumber; SMC_l_OwnerID)
	C_TEXT:C284($_t_ModifiedText; $_t_oldMethodName; $_t_ScriptText; SMC_T_MacroText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SMC_SaveMacroInfo")
//this method saves data on the macro changes.
//this is ONLY to be called from the trigger
READ ONLY:C145([CLIENT_SERVERMESSAGES:123])
LOAD RECORD:C52([CLIENT_SERVERMESSAGES:123])
$_t_ModifiedText:=""
$_l_TableNumber:=Table:C252(->[SCRIPTS:80])
If (Is table number valid:C999($_l_TableNumber))
	For ($_l_FIeldIndex; 1; Get last field number:C255($_l_TableNumber))
		If (Is field number valid:C1000($_l_TableNumber; $_l_FIeldIndex))
			
			If ((Type:C295(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)#Is picture:K8:10) & (Type:C295(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)#Is text:K8:3) & (Type:C295(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)#Is subtable:K8:11) & (Type:C295(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)#Is BLOB:K8:12))
				If (Old:C35(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)#(Field:C253($_l_TableNumber; $_l_FIeldIndex)->))
					//the field is modified
					If ($_t_ModifiedText="")
						$_t_ModifiedText:=Table name:C256($_l_TableNumber)+" field "+Field name:C257($_l_TableNumber; $_l_FIeldIndex)+Char:C90(13)
					Else 
						$_t_ModifiedText:=$_t_ModifiedText+Char:C90(9)+Table name:C256($_l_TableNumber)+" field "+Field name:C257($_l_TableNumber; $_l_FIeldIndex)+Char:C90(13)
					End if 
					Case of 
						: (Type:C295(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)=Is alpha field:K8:1)
							If (Old:C35(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)="")
								$_t_ModifiedText:=$_t_ModifiedText+"Set to "+Char:C90(13)+(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)+Char:C90(13)
							Else 
								$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+Char:C90(13)+Old:C35(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)+" to"+(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)+Char:C90(13)
							End if 
						: (Type:C295(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)=Is text:K8:3)
							If (Old:C35(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)="")
								$_t_ModifiedText:=$_t_ModifiedText+" Set to "+(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)+Char:C90(13)
							Else 
								$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+Char:C90(13)+Old:C35(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)+" to"+(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)+Char:C90(13)
							End if 
						: (Type:C295(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)=Is real:K8:4)
							If (Old:C35(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)=0)
								$_t_ModifiedText:=$_t_ModifiedText+" Set to "+Char:C90(13)+String:C10((Field:C253($_l_TableNumber; $_l_FIeldIndex)->))+Char:C90(13)
							Else 
								$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+Char:C90(13)+String:C10(Old:C35(Field:C253($_l_TableNumber; $_l_FIeldIndex)->))+" to"+String:C10((Field:C253($_l_TableNumber; $_l_FIeldIndex)->))+Char:C90(13)
							End if 
						: (Type:C295(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)=Is integer:K8:5)
							If (Old:C35(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)=0)
								$_t_ModifiedText:=$_t_ModifiedText+" Set to "+Char:C90(13)+String:C10(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)+Char:C90(13)
							Else 
								$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+Char:C90(13)+String:C10(Old:C35(Field:C253($_l_TableNumber; $_l_FIeldIndex)->))+" to"+String:C10((Field:C253($_l_TableNumber; $_l_FIeldIndex)->))+Char:C90(13)
							End if 
						: (Type:C295(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)=Is longint:K8:6)
							If (Old:C35(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)=0)
								$_t_ModifiedText:=$_t_ModifiedText+" Set to "+Char:C90(13)+String:C10((Field:C253($_l_TableNumber; $_l_FIeldIndex)->))+Char:C90(13)
							Else 
								$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+Char:C90(13)+String:C10(Old:C35(Field:C253($_l_TableNumber; $_l_FIeldIndex)->))+" to"+String:C10((Field:C253($_l_TableNumber; $_l_FIeldIndex)->))+Char:C90(13)
							End if 
						: (Type:C295(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)=Is date:K8:7)
							If (Old:C35(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)=!00-00-00!)
								$_t_ModifiedText:=$_t_ModifiedText+" Set to "+Char:C90(13)+String:C10((Field:C253($_l_TableNumber; $_l_FIeldIndex)->))+Char:C90(13)
							Else 
								$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+Char:C90(13)+String:C10(Old:C35(Field:C253($_l_TableNumber; $_l_FIeldIndex)->))+" to"+String:C10((Field:C253($_l_TableNumber; $_l_FIeldIndex)->))+Char:C90(13)
							End if 
						: (Type:C295(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)=Is time:K8:8)
							If (Old:C35(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)=?00:00:00?)
								$_t_ModifiedText:=$_t_ModifiedText+" Set to"+String:C10((Field:C253($_l_TableNumber; $_l_FIeldIndex)->))+Char:C90(13)
							Else 
								$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+Char:C90(13)+String:C10(Old:C35(Field:C253($_l_TableNumber; $_l_FIeldIndex)->))+" to"+String:C10((Field:C253($_l_TableNumber; $_l_FIeldIndex)->))+Char:C90(13)
							End if 
						: (Type:C295(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)=Is boolean:K8:9)
							If (Old:C35(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)=False:C215) & (Field:C253($_l_TableNumber; $_l_FIeldIndex)->=True:C214)
								$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+Char:C90(13)+"FALSE"+" to"+"TRUE"+Char:C90(13)
							Else 
								$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+Char:C90(13)+"TRUE"+" to"+"FALSE"+Char:C90(13)
							End if 
						: (Type:C295(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)=Is picture:K8:10)
							$_t_ModifiedText:=$_t_ModifiedText+" Picture Changed "+Char:C90(13)
						: (Type:C295(Field:C253($_l_TableNumber; $_l_FIeldIndex)->)=Is subtable:K8:11)
					End case 
				End if 
			Else 
				//`
				
			End if 
		End if 
	End for 
	$_t_ScriptText:=Macro_PlatformTranslate(->[SCRIPTS:80]Recording_Text:4)
	If ($_t_ScriptText#SMC_T_MacroText)
		$_t_ModifiedText:=$_t_ModifiedText+Char:C90(13)+"Macro Changed from:"+Char:C90(13)+SMC_T_MacroText
	End if 
	
	If ($_t_ModifiedText#"")
		ARRAY TEXT:C222(SMC_at_LastEditedPersons; 0)
		ARRAY DATE:C224(SMC_ad_LastModifiedDates; 0)
		ARRAY TEXT:C222(SMC_at_LastModifiedTexts; 0)
		$_l_offset:=0
		BLOB TO VARIABLE:C533([SCRIPTS:80]Modified_Info:14; SMC_l_OwnerID; $_l_offset)
		If (BLOB size:C605([SCRIPTS:80]Modified_Info:14)>$_l_offset)
			BLOB TO VARIABLE:C533([SCRIPTS:80]Modified_Info:14; SMC_at_LastEditedPersons; $_l_offset)
			If (BLOB size:C605([SCRIPTS:80]Modified_Info:14)>$_l_offset)
				BLOB TO VARIABLE:C533([SCRIPTS:80]Modified_Info:14; SMC_ad_LastModifiedDates; $_l_offset)
				If (BLOB size:C605([SCRIPTS:80]Modified_Info:14)>$_l_offset)
					BLOB TO VARIABLE:C533([SCRIPTS:80]Modified_Info:14; SMC_at_LastModifiedTexts; $_l_offset)
				End if 
			End if 
			
		End if 
		
		INSERT IN ARRAY:C227(SMC_at_LastEditedPersons; Size of array:C274(SMC_at_LastEditedPersons)+1; 1)
		SMC_at_LastEditedPersons{Size of array:C274(SMC_at_LastEditedPersons)}:=[CLIENT_SERVERMESSAGES:123]USER_NAME:2
		INSERT IN ARRAY:C227(SMC_ad_LastModifiedDates; Size of array:C274(SMC_ad_LastModifiedDates)+1; 1)
		SMC_ad_LastModifiedDates{Size of array:C274(SMC_ad_LastModifiedDates)}:=Current date:C33(*)
		INSERT IN ARRAY:C227(SMC_at_LastModifiedTexts; Size of array:C274(SMC_at_LastModifiedTexts)+1; 1)
		SMC_at_LastModifiedTexts{Size of array:C274(SMC_at_LastModifiedTexts)}:=$_t_ModifiedText
		SET BLOB SIZE:C606([SCRIPTS:80]Modified_Info:14; 0)
		If (SMC_l_OwnerID=0)
			SMC_l_OwnerID:=[CLIENT_SERVERMESSAGES:123]USER_ID:1
		End if 
		SET BLOB SIZE:C606([SCRIPTS:80]Modified_Info:14; 0)
		VARIABLE TO BLOB:C532(SMC_l_OwnerID; [SCRIPTS:80]Modified_Info:14; *)
		VARIABLE TO BLOB:C532(SMC_at_LastEditedPersons; [SCRIPTS:80]Modified_Info:14; *)
		VARIABLE TO BLOB:C532(SMC_ad_LastModifiedDates; [SCRIPTS:80]Modified_Info:14; *)
		VARIABLE TO BLOB:C532(SMC_at_LastModifiedTexts; [SCRIPTS:80]Modified_Info:14; *)
	End if 
	
End if 
ERR_MethodTrackerReturn("SMC_SaveMacroInfo"; $_t_oldMethodName)
