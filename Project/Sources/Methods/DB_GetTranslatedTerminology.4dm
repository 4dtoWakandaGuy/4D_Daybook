//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetTranslatedTerminology
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 18:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_TerminologyClass;0)
	//ARRAY LONGINT(DB_al_TerminologyTable;0)
	//ARRAY TEXT(DB_at_TerminologyName;0)
	//ARRAY TEXT(DB_at_TerminologyTranslate;0)
	C_BOOLEAN:C305(DB_bo_TranslationInited)
	C_LONGINT:C283($_l_CharCode; $_l_CharIndex; $_l_TableRow; $_l_TerminologyIndex; $1)
	C_TEXT:C284($_t_CharString; $_t_oldMethodName; $_t_Output; $_t_TranslatedText; $0; $2)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("DB_GetTranslatedTerminology")
If (Count parameters:C259>=2)
	If (Not:C34(DB_bo_TranslationInited))
		DB_LoadTerminologyPreferences
		DB_bo_TranslationInited:=True:C214
	End if 
	
	$_t_Output:=$2
	$_l_TableRow:=Find in array:C230(DB_al_TerminologyTable; $1)
	If ($_l_TableRow>0)
		For ($_l_TerminologyIndex; $_l_TableRow; Size of array:C274(DB_al_TerminologyTable))
			If (DB_al_TerminologyTable{$_l_TerminologyIndex}=$1)
				Case of 
					: (DB_al_TerminologyClass{$_l_TerminologyIndex}=4)
						$_t_CharString:=""
						For ($_l_CharIndex; 1; Length:C16($_t_Output))
							$_l_CharCode:=Character code:C91($_t_Output[[$_l_CharIndex]])
							$_t_CharString:=$_t_CharString+String:C10($_l_CharCode)
						End for 
						$_t_TranslatedText:=""
						For ($_l_CharIndex; 1; Length:C16(DB_at_TerminologyTranslate{$_l_TerminologyIndex}))
							$_l_CharCode:=Character code:C91(DB_at_TerminologyTranslate{$_l_TerminologyIndex}[[$_l_CharIndex]])
							$_t_TranslatedText:=$_t_CharString+String:C10($_l_CharCode)
						End for 
						If (Position:C15($_t_TranslatedText; $_t_CharString)>0)
							//The replace just uses the string-the case sensitive comparison is done
							$_t_Output:=Replace string:C233($_t_Output; DB_at_TerminologyName{$_l_TerminologyIndex}; DB_at_TerminologyTranslate{$_l_TerminologyIndex})
						End if 
					Else 
						Case of 
							: (Position:C15(" "; $_t_Output)>0)
								If (Position:C15(DB_at_TerminologyName{$_l_TerminologyIndex}+" "; $_t_Output)>0)
									$_t_Output:=Replace string:C233($_t_Output; DB_at_TerminologyName{$_l_TerminologyIndex}; DB_at_TerminologyTranslate{$_l_TerminologyIndex})
								Else 
									If (Position:C15(" "+DB_at_TerminologyName{$_l_TerminologyIndex}; $_t_Output)>0)
										$_t_Output:=Replace string:C233($_t_Output; DB_at_TerminologyName{$_l_TerminologyIndex}; DB_at_TerminologyTranslate{$_l_TerminologyIndex})
									End if 
								End if 
							Else 
								$_t_Output:=Replace string:C233($_t_Output; DB_at_TerminologyName{$_l_TerminologyIndex}; DB_at_TerminologyTranslate{$_l_TerminologyIndex})
						End case 
				End case 
				
			Else 
				$_l_TerminologyIndex:=Size of array:C274(DB_al_TerminologyTable)
			End if 
		End for 
		$0:=$_t_Output
	End if 
	
	
End if 
ERR_MethodTrackerReturn("DB_GetTranslatedTerminology"; $_t_oldMethodName)