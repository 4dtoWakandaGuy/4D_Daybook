//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_DeDupCompany
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_CompanyNamesAdjusted; 0)
	//ARRAY TEXT(SD_at_CompanyCodes;0)
	//ARRAY TEXT(SD_at_CompanyNames;0)
	C_BOOLEAN:C305(COM_bo_Resurrection; COM_DeDupShowDeleted; SD_bo_OptionSelected; SD_bo_OptionSelectionOLD; SD_bo_CompanyRejected)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_Index; $_l_SoundexLength; $_l_SpacePosition; $_l_TableNumber; r1; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($_ptr_Table; $2)
	C_REAL:C285($3; $4)
	C_TEXT:C284($_t_Characters; $_t_FilterCompanyName; $_t_FirstCharacter; $_t_oldMethodName; $_t_OutboundPostcode; $_t_Soundex; $_t_SoundexSubString; $_t_Sounds; $0; $1; VpostCode)
	C_TEXT:C284(VTown)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_DeDupCompany")
//First we create a sound alike string

SD_bo_CompanyRejected:=False:C215
$_t_Characters:="aehiouwybfpvcgjkqsxzdtlmnr"
$_t_Sounds:="11111111222233333333445667"
$0:=$1
If (Count parameters:C259>=2)
	If ($1#"")
		//now filter out any extranious chars first
		$_t_FilterCompanyName:=DB_CompanyNameClean($1)
		If ($_t_FilterCompanyName#"")
			$_t_FirstCharacter:=$_t_FilterCompanyName[[1]]
			//Now we build a soundex of that
			$_t_Soundex:=DB_BuildSoundex($_t_FilterCompanyName)
			$_l_TableNumber:=Table:C252($2)
			$_ptr_Table:=Table:C252($_l_TableNumber)
			CREATE EMPTY SET:C140($_ptr_Table->; "JOIN")
			CREATE EMPTY SET:C140($_ptr_Table->; "ReturnSet")
			$_l_SoundexLength:=Length:C16($_t_Soundex)
			Repeat 
				
				$_t_SoundexSubString:=Substring:C12($_t_Soundex; 1; $_l_SoundexLength)
				$_l_SoundexLength:=$_l_SoundexLength-1
				QUERY:C277($_ptr_Table->; $2->=$_t_SoundexSubString+"@")
				
				If (Records in selection:C76($_ptr_Table->)>0)
					If (Not:C34(COM_DeDupShowDeleted))
						QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Deleted:61=0)
					End if 
					QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Company_Name:2#"")
					QUERY SELECTION BY FORMULA:C207([COMPANIES:2]; DB_CompanyNameClean([COMPANIES:2]Company_Name:2)[[1]]=$_t_FirstCharacter)
					CREATE SET:C116($_ptr_Table->; "JOIN")
					UNION:C120("ReturnSet"; "JOIN"; "ReturnSet")
					
				End if 
			Until (Length:C16($_t_SoundexSubString)<=5)
			CLEAR SET:C117("JOIN")
			USE SET:C118("ReturnSet")
			//Clear set("ReturnSet")
			If (r1=1)
				QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Private:37=True:C214)
			Else 
				QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Private:37=False:C215)
			End if 
			If (VTown#"")
				QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Town_or_City:5=vTown+"@")
			End if 
			If (VpostCode#"")
				$_l_SpacePosition:=Position:C15(" "; VpostCode)
				If ($_l_SpacePosition>0)
					$_t_OutboundPostcode:=Substring:C12(VPostCode; 1; $_l_SpacePosition-1)
				Else 
					$_t_OutboundPostcode:=VpostCode
				End if 
				QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Postal_Code:7=$_t_OutboundPostcode+"@")
			End if 
			
			
			//CLEAR SET("ReturnSet")
			If (Records in selection:C76([COMPANIES:2])>0)
				If (Records in set:C195("Rejected")>0)  // Empty set is created before forms are displayed
					DIFFERENCE:C122("ReturnSet"; "Rejected"; "ReturnSet")
					USE SET:C118("ReturnSet")
					
				End if 
				
				If (Records in selection:C76([COMPANIES:2])>0)
					SELECTION TO ARRAY:C260([COMPANIES:2]Company_Code:1; SD_at_CompanyCodes; [COMPANIES:2]Company_Name:2; SD_at_CompanyNames)
					ARRAY TEXT:C222($_at_CompanyNamesAdjusted; Size of array:C274(SD_at_CompanyCodes))
					For ($_l_Index; 1; Size of array:C274(SD_at_CompanyNames))
						$_at_CompanyNamesAdjusted{$_l_Index}:=DB_CompanyNameClean(SD_at_CompanyNames{$_l_Index})
					End for 
					SORT ARRAY:C229($_at_CompanyNamesAdjusted; SD_at_CompanyNames; SD_at_CompanyCodes)
					UNLOAD RECORD:C212([COMPANIES:2])
					$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
					WIN_l_CurrentWinRef:=Open window:C153($3; $4; $3; $4; -1984)
					SD_bo_OptionSelectionOLD:=SD_bo_OptionSelected
					DIALOG:C40([USER:15]; "CompanySelect")
					CLOSE WINDOW:C154
					WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
					UNLOAD RECORD:C212([COMPANIES:2])
					If (Not:C34(SD_bo_OptionSelected))
						If (SD_at_CompanyNames>0)
							$0:=SD_at_CompanyNames{SD_at_CompanyNames}
							CANCEL:C270
							
						Else 
							UNION:C120("ReturnSet"; "Rejected"; "Rejected")
							SD_bo_CompanyRejected:=True:C214
							$0:=$1
						End if 
						CLEAR SET:C117("ReturnSet")
					Else 
						If (SD_bo_OptionSelectionOLD#SD_bo_OptionSelected)
							//note :here recall same method-same selection but with deletions included will show
							CLEAR SET:C117("ReturnSet")
							COM_bo_Resurrection:=False:C215
							$0:=DB_DeDupCompany($1; $2; $3; $4)
							If ($0=$1) & (OK=1)
								
								COM_bo_Resurrection:=True:C214
							End if 
						Else 
							If (SD_at_CompanyNames>0)
								$0:=SD_at_CompanyNames{SD_at_CompanyNames}
								CANCEL:C270
								
							Else 
								UNION:C120("ReturnSet"; "Rejected"; "Rejected")
								SD_bo_CompanyRejected:=True:C214
								$0:=$1
							End if 
							CLEAR SET:C117("ReturnSet")
							
						End if 
						
					End if 
					SD_bo_OptionSelected:=False:C215
				Else 
					CLEAR SET:C117("ReturnSet")
					$0:=$1
					
					
				End if 
			Else 
				CLEAR SET:C117("ReturnSet")
				$0:=$1
				
				
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DB_DeDupCompany"; $_t_oldMethodName)