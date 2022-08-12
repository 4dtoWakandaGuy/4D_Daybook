//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_Sel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  17/06/2010 22:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SD3_at_HistoryRelation;0)
	C_BOOLEAN:C305(<>SelOr)
	C_DATE:C307($_d_DiaryDate)
	C_LONGINT:C283(<>AutoProc; $_l_StringLength)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $_t_SearchAt; $1; DB_t_CurrentFormUsage; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_Sel2")
$_t_Search:=$1

If (<>AutoProc=987654321)
	<>AutoProc:=0
	USE NAMED SELECTION:C332("◊IA")
	$_t_Search:="◊IA"
Else 
	If ((<>SD3_at_HistoryRelation>1) & (vAutofind))
		GOTO RECORD:C242([DIARY:12]; <>AutoProc)
		Diary_HistSrch
		<>SD3_at_HistoryRelation:=1
		<>AutoProc:=0
	Else 
		vSelPrev:=$_t_Search
		If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
			ALL RECORDS:C47([DIARY:12])
			
		Else 
			If ($_t_Search="Document: @")
				$_l_StringLength:=Length:C16("Document: ")
				$_t_Search:=Substring:C12($_t_Search; $_l_StringLength+1; 32000)
				QUERY:C277([DIARY:12]; [DIARY:12]Document_Code:15=$_t_Search)
			Else 
				
				If ($_t_Search="Contact: @")
					$_t_Search:=Substring:C12($_t_Search; 10; 32000)
					QUERY:C277([DIARY:12]; [DIARY:12]Contact_Code:2=$_t_Search)
				Else 
					If ($_t_Search="Company: @")
						$_t_Search:=Substring:C12($_t_Search; 10; 32000)
						QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=$_t_Search)
					Else 
						If ($_t_Search="Order: @")
							$_t_Search:=Substring:C12($_t_Search; 8; 32000)
							QUERY:C277([DIARY:12]; [DIARY:12]Order_Code:26=$_t_Search)
						Else 
							
							If ($_t_Search="Job: @")
								$_t_Search:=Substring:C12($_t_Search; 6; 32000)
								QUERY:C277([DIARY:12]; [DIARY:12]Job_Code:19=$_t_Search)
							Else 
								If ($_t_Search="Diary: @")
									$_t_Search:=Substring:C12($_t_Search; 8; 32000)
									QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_t_Search)
								Else 
									If ($_t_Search="Call: @")
										$_t_Search:=Substring:C12($_t_Search; 7; 32000)
										QUERY:C277([DIARY:12]; [DIARY:12]Call_Code:25=$_t_Search; *)
										$_t_Search:=$_t_Search+"@"
										QUERY:C277([DIARY:12];  | ; [DIARY:12]Diary_Code:3=$_t_Search)
									Else 
										If ($_t_Search="Rec No: @")
											GOTO RECORD:C242([DIARY:12]; <>AutoProc)
											<>AutoProc:=0
										Else 
											$_d_DiaryDate:=Diary_SelDate($_t_Search)
											If ($_d_DiaryDate>!1990-01-01!)
												//         If ($_d_DiaryDate>=◊CDate)
												QUERY:C277([DIARY:12]; [DIARY:12]Date_Do_To:33>=$_d_DiaryDate; *)
												QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4<=$_d_DiaryDate; *)
												//       Else
												QUERY:C277([DIARY:12];  | ; [DIARY:12]Date_Done_To:34>=$_d_DiaryDate; *)
												QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_From:5<=$_d_DiaryDate)
												//      End if
											Else 
												$_d_DiaryDate:=!00-00-00!
											End if 
											If ((Records in selection:C76([DIARY:12])=0) | ($_d_DiaryDate=!00-00-00!))
												$_t_SearchAt:=Sel_AtSign($_t_Search)
												QUERY:C277([DIARY:12]; [DIARY:12]Person:8=$_t_Search)
												SelOr_1(->[DIARY:12])
												If ((Records in selection:C76([DIARY:12])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
													If (DB_t_CurrentFormUsage="Time")
														Sel_NoAtAt(->[DIARY:12]; ->[DIARY:12]Job_Code:19; $_t_Search; $_t_SearchAt)
														SelOr_3(->[DIARY:12])
													Else 
														Sel_NoAtAt(->[DIARY:12]; ->[DIARY:12]Company_Code:1; $_t_Search; $_t_SearchAt)
														SelOr_2(->[DIARY:12])
														If ((Records in selection:C76([DIARY:12])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
															Sel_NoAtAt(->[DIARY:12]; ->[DIARY:12]Contact_Code:2; $_t_Search; $_t_SearchAt)
															SelOr_2(->[DIARY:12])
															If ((Records in selection:C76([DIARY:12])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
																Sel_NoAtAt(->[DIARY:12]; ->[DIARY:12]Diary_Code:3; $_t_Search; $_t_SearchAt)
																SelOr_2(->[DIARY:12])
																If ((Records in selection:C76([DIARY:12])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
																	Sel_NoAtAt(->[DIARY:12]; ->[DIARY:12]Document_Code:15; $_t_Search; $_t_SearchAt)
																	SelOr_2(->[DIARY:12])
																	If ((Records in selection:C76([DIARY:12])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
																		CompCont_Proj($_t_SearchAt; ->[DIARY:12]Company_Code:1; ->[DIARY:12]Contact_Code:2)
																		SelOr_3(->[DIARY:12])
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
							End if 
							
						End if 
					End if 
				End if 
				
			End if 
		End if 
	End if 
	Sel_FindMy(->[DIARY:12]; ->[DIARY:12]Person:8; ->[DIARY:12]Originator:23)
End if 
ERR_MethodTrackerReturn("Diary_Sel2"; $_t_oldMethodName)