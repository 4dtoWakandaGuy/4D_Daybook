//%attributes = {}
If (False:C215)
	//Project Method Name:      Qualities_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 13:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>AutoProc; <>MENU_l_BarModule; vA; xNext)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $_t_SearchAt; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Qualities_Sel")
//Qualities_Sel
//DEFAULT TABLE([INFORMATION])
vA:=1
If (vSelPrev="•FSC")
	Qualities_SelP
Else 
	If (<>MENU_l_BarModule=14)
		$_t_Search:=Sel_CompCode
	Else 
		$_t_Search:=Sel_ContCode
	End if 
	$_t_Search:=Gen_SearchA("Code, Name, Group or Sub-Group to find:"; vSelPrev; "Find Qualitative information"; $_t_Search; ""; "")
	If (OK=1)
		If (xNext=0)
			vSelPrev:=$_t_Search
			If (<>AutoProc=987654321)
				<>AutoProc:=0
				USE NAMED SELECTION:C332("◊IA")
				$_t_Search:="◊IA"
			Else 
				If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
					ALL RECORDS:C47([INFORMATION:55])
				Else 
					If ($_t_Search="Contact: @")
						$_t_Search:=Substring:C12($_t_Search; 10; 32000)
						QUERY:C277([INFORMATION:55]; [INFORMATION:55]Contact_Code:1=$_t_Search)
					Else 
						If ($_t_Search="Company: @")
							$_t_Search:=Substring:C12($_t_Search; 10; 32000)
							QUERY:C277([INFORMATION:55]; [INFORMATION:55]Company_Code:7=$_t_Search)
						Else 
							$_t_SearchAt:=Sel_AtSign($_t_Search)
							Sel_NoAtAt(->[INFORMATION:55]; ->[INFORMATION:55]Contact_Code:1; $_t_Search; $_t_SearchAt)
							If (Records in selection:C76([INFORMATION:55])=0)
								QUERY:C277([INFORMATION:55]; [INFORMATION:55]Group:2=$_t_SearchAt)
								If (Records in selection:C76([INFORMATION:55])=0)
									QUERY:C277([INFORMATION:55]; [INFORMATION:55]SubGroup:6=$_t_SearchAt)
									If (Records in selection:C76([INFORMATION:55])=0)
										Sel_NoAtAt(->[INFORMATION:55]; ->[INFORMATION:55]Company_Code:7; $_t_Search; $_t_SearchAt)
										If (Records in selection:C76([INFORMATION:55])=0)
											QUERY:C277([CONTACTS:1]; [CONTACTS:1]Surname:5=$_t_SearchAt)
											If (Records in selection:C76([CONTACTS:1])>0)
												RELATE MANY SELECTION:C340([INFORMATION:55]Contact_Code:1)
											End if 
											If (Records in selection:C76([INFORMATION:55])=0)
												QUERY:C277([CONTACTS:1]; [CONTACTS:1]Forename:4=$_t_SearchAt)
												If (Records in selection:C76([CONTACTS:1])>0)
													RELATE MANY SELECTION:C340([INFORMATION:55]Contact_Code:1)
												End if 
											End if 
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		Else 
			Qualities_SelP
		End if 
	Else 
		vA:=0
	End if 
End if 
ERR_MethodTrackerReturn("Qualities_Sel"; $_t_oldMethodName)