//%attributes = {}
If (False:C215)
	//Project Method Name:      Calls_Sel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   15/06/2010 10:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>AutoProc)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $_t_SearchAt; $1; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls_Sel2")
$_t_Search:=$1
vSelPrev:=$_t_Search
If (<>AutoProc=987654321)
	<>AutoProc:=0
	USE NAMED SELECTION:C332("◊IA")
	$_t_Search:="◊IA"
Else 
	If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
		ALL RECORDS:C47([SERVICE_CALLS:20])
	Else 
		If ($_t_Search="Company: @")
			$_t_Search:=Substring:C12($_t_Search; 10; 32000)
			QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Company_Code:1=$_t_Search)
		Else 
			If ($_t_Search="Contact: @")
				$_t_Search:=Substring:C12($_t_Search; 10; 32000)
				QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Contact_Code:2=$_t_Search)
			Else 
				If ($_t_Search="Call: @")
					$_t_Search:=Substring:C12($_t_Search; 7; 32000)
					QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Call_Code:4=$_t_Search)
				Else 
					$_t_SearchAt:=Sel_AtSign($_t_Search)
					Sel_NoAtAt(->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Call_Code:4; $_t_Search; $_t_SearchAt)
					If (Records in selection:C76([SERVICE_CALLS:20])=0)
						Sel_NoAtAt(->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Company_Code:1; $_t_Search; $_t_SearchAt)
						If (Records in selection:C76([SERVICE_CALLS:20])=0)
							Sel_NoAtAt(->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Contact_Code:2; $_t_Search; $_t_SearchAt)
							If (Records in selection:C76([SERVICE_CALLS:20])=0)
								QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Person:11=$_t_Search; *)
								QUERY:C277([SERVICE_CALLS:20];  & ; [SERVICE_CALLS:20]Resolved:9=False:C215)
								If (Records in selection:C76([SERVICE_CALLS:20])=0)
									CompCont_Proj($_t_SearchAt; ->[SERVICE_CALLS:20]Company_Code:1; ->[SERVICE_CALLS:20]Contact_Code:2)
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Calls_Sel2"; $_t_oldMethodName)