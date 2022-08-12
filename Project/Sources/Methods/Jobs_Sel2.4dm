//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_Sel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  15/06/2010 11:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SelOr)
	C_LONGINT:C283(<>AutoProc)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $_t_SearchAt; vSelPrev)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_Sel2")


vSelPrev:=$_t_Search
If (<>AutoProc=987654321)
	<>AutoProc:=0
	USE NAMED SELECTION:C332("◊IA")
	$_t_Search:="◊IA"
Else 
	If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
		ALL RECORDS:C47([JOBS:26])
	Else 
		If ($_t_Search="Company: @")
			$_t_Search:=Substring:C12($_t_Search; 10; 32000)
			QUERY:C277([JOBS:26]; [JOBS:26]Company_Code:3=$_t_Search)
		Else 
			If ($_t_Search="Contact: @")
				$_t_Search:=Substring:C12($_t_Search; 10; 32000)
				QUERY:C277([JOBS:26]; [JOBS:26]Contact_Code:4=$_t_Search)
			Else 
				If ($_t_Search="Job: @")
					$_t_Search:=Substring:C12($_t_Search; 6; 32000)
					QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=$_t_Search)
				Else 
					$_t_SearchAt:=Sel_AtSign($_t_Search)
					Sel_NoAtAt(->[JOBS:26]; ->[JOBS:26]Job_Code:1; $_t_Search; $_t_SearchAt)
					SelOr_1(->[JOBS:26])
					If ((Records in selection:C76([JOBS:26])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
						QUERY:C277([JOBS:26]; [JOBS:26]Job_Name:2=$_t_SearchAt)
						SelOr_2(->[JOBS:26])
						If ((Records in selection:C76([JOBS:26])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
							QUERY:C277([JOBS:26]; [JOBS:26]Project_Code:27=$_t_SearchAt)
							SelOr_2(->[JOBS:26])
							If ((Records in selection:C76([JOBS:26])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
								Sel_NoAtAt2(->[JOBS:26]; ->[JOBS:26]Company_Code:3; ->[JOBS:26]Contact_Code:4; $_t_Search; $_t_SearchAt)
								SelOr_2(->[JOBS:26])
								If ((Records in selection:C76([JOBS:26])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
									CompCont_Proj($_t_SearchAt; ->[JOBS:26]Company_Code:3; ->[JOBS:26]Contact_Code:4)
									SelOr_3(->[JOBS:26])
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Jobs_Sel2"; $_t_oldMethodName)