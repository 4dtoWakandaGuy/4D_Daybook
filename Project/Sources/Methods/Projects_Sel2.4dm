//%attributes = {}
If (False:C215)
	//Project Method Name:      Projects_Sel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  15/06/2010 11:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SelOr)
	C_LONGINT:C283(<>AutoProc)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $_t_SearchAt; $1; vSelPrev)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Projects_Sel2")
$_t_Search:=$1

vSelPrev:=$_t_Search
If (<>AutoProc=987654321)
	<>AutoProc:=0
	USE NAMED SELECTION:C332("◊IA")
	$_t_Search:="◊IA"
Else 
	If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
		ALL RECORDS:C47([PROJECTS:89])
	Else 
		If ($_t_Search="Company: @")
			$_t_Search:=Substring:C12($_t_Search; 10; 32000)
			QUERY:C277([PROJECTS:89]; [PROJECTS:89]Company_Code:3=$_t_Search)
		Else 
			If ($_t_Search="Contact: @")
				$_t_Search:=Substring:C12($_t_Search; 10; 32000)
				QUERY:C277([PROJECTS:89]; [PROJECTS:89]Contact_Code:4=$_t_Search)
			Else 
				If ($_t_Search="Project: @")
					//$_t_Search:=Substring($_t_Search;6;32000)
					$_t_Search:=Substring:C12($_t_Search; 10; 32000)  //bug fix, changed 6 to 10, 27/04/07 -kmw
					QUERY:C277([PROJECTS:89]; [PROJECTS:89]Project_Code:1=$_t_Search)
				Else 
					$_t_SearchAt:=Sel_AtSign($_t_Search)
					Sel_NoAtAt(->[PROJECTS:89]; ->[PROJECTS:89]Project_Code:1; $_t_Search; $_t_SearchAt)
					SelOr_1(->[PROJECTS:89])
					If ((Records in selection:C76([PROJECTS:89])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
						QUERY:C277([PROJECTS:89]; [PROJECTS:89]Project_Name:2=$_t_SearchAt)
						SelOr_2(->[PROJECTS:89])
						If ((Records in selection:C76([PROJECTS:89])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
							Sel_NoAtAt2(->[PROJECTS:89]; ->[PROJECTS:89]Company_Code:3; ->[PROJECTS:89]Contact_Code:4; $_t_Search; $_t_SearchAt)
							SelOr_2(->[PROJECTS:89])
							If ((Records in selection:C76([PROJECTS:89])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
								CompCont_Proj($_t_SearchAt; ->[PROJECTS:89]Company_Code:3; ->[PROJECTS:89]Contact_Code:4)
								SelOr_3(->[PROJECTS:89])
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Projects_Sel2"; $_t_oldMethodName)
