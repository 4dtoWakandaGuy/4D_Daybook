//%attributes = {}
If (False:C215)
	//Project Method Name:      ADR_ApplyISOCountry
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2012 16:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CCM_at_CountryCodes;0)
	//ARRAY TEXT(CCM_at_CountryNames;0)
	//ARRAY TEXT(DM_at_CountryCodes;0)
	//ARRAY TEXT(DM_at_CountryNames;0)
	C_LONGINT:C283($_l_CountryPosition; $_l_Index; $_l_ISOPosition)
	C_TEXT:C284(<>SYS_t_LastSavedTableName; $_t_CountryName; $_t_oldMethodName)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ADR_ApplyISOCountry")
READ WRITE:C146([COUNTRIES:73])
DM_ReadISOCountries
DM_GetISOCurrencies
If (False:C215)
	For ($_l_Index; 1; Size of array:C274(CCM_at_CountryCodes))
		$_l_ISOPosition:=Find in array:C230(DM_at_CountryNames; CCM_at_CountryNames{$_l_Index})
		If ($_l_ISOPosition<0)
			
		End if 
	End for 
End if 
If (False:C215)
	For ($_l_Index; 1; Size of array:C274(DM_at_CountryNames))
		$_l_ISOPosition:=Find in array:C230(CCM_at_CountryNames; DM_at_CountryNames{$_l_Index})
		If ($_l_ISOPosition<0)
			
		End if 
	End for 
End if 
$_ti_DocumentRef:=Create document:C266("MISSING COUNTRIES"; "TEXT")
For ($_l_Index; 1; Size of array:C274(DM_at_CountryNames))
	QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]ISO_Code:6=DM_at_CountryCodes{$_l_Index})
	If (Records in selection:C76([COUNTRIES:73])=0)
		SEND PACKET:C103($_ti_DocumentRef; DM_at_CountryNames{$_l_Index}+Char:C90(13))
	End if 
End for 

CLOSE DOCUMENT:C267($_ti_DocumentRef)
If (False:C215)
	
	READ WRITE:C146(*)
	
	ALL RECORDS:C47([COUNTRIES:73])
	
	For ($_l_Index; 1; Records in selection:C76([COUNTRIES:73]))
		If ([COUNTRIES:73]ISO_Code:6="")
			$_l_ISOPosition:=Find in array:C230(DM_at_CountryNames; [COUNTRIES:73]COUNTRY_CODE:1)
			If ($_l_ISOPosition>0)
				[COUNTRIES:73]ISO_Code:6:=DM_at_CountryCodes{$_l_ISOPosition}
				
				
			End if 
		Else 
			$_l_ISOPosition:=Find in array:C230(DM_at_CountryCodes; [COUNTRIES:73]ISO_Code:6)
			If ($_l_ISOPosition>0)
				$_t_CountryName:=DM_at_CountryNames{$_l_ISOPosition}
				$_l_CountryPosition:=Find in array:C230(CCM_at_CountryNames; DM_at_CountryNames{$_l_ISOPosition})
				If ($_l_CountryPosition>0)
					[COUNTRIES:73]ISO_Currency:8:=CCM_at_CountryCodes{$_l_CountryPosition}
					<>SYS_t_LastSavedTableName:="COUNTRIES"
					SAVE RECORD:C53([COUNTRIES:73])
				End if 
			End if 
		End if 
		NEXT RECORD:C51([COUNTRIES:73])
	End for 
End if 
ERR_MethodTrackerReturn("ADR_ApplyISOCountry"; $_t_oldMethodName)