//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      SuperDiary_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 14:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array TEXT(<>SD3_at_HistoryRelation;0)
	C_BOOLEAN:C305(<>SelOr)
	C_DATE:C307($D)
	C_LONGINT:C283(<>AutoProc; vD; xNext)
	C_TEXT:C284(<>CallCode; <>JobCode; <>OrderCode; <>TimeAct; $_t_oldMethodName; $_t_Search; $_t_SearchAt; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SuperDiary_Sel")
//SuperDiary_Sel
//DEFAULT TABLE([PERSONNEL])
vD:=1
$_t_Search:=""
If (vSelPrev="•FSC")
	Diary_SelP
Else 
	If (DB_t_CurrentFormUsage="Time")
		$_t_Search:=Gen_Search("Job, Date or Person to find:"; vSelPrev; "Find Time")
	Else 
		Case of 
			: (<>OrderCode#"")
				$_t_Search:="Order: "+<>OrderCode
				
			: (<>JobCode#"")
				$_t_Search:="Job: "+<>JobCode
			: (<>CallCode#"")
				$_t_Search:="Call: "+<>CallCode
				
			Else 
				$_t_Search:=""
		End case 
		$_t_Search:=Gen_SearchA("Company, Date, Person or Document to find:"; vSelPrev; "Find Diary Items"; $_t_Search; Sel_ContCode; Sel_CompCode)
	End if 
	If (OK=1)
		If (xNext=0)
			If (<>AutoProc=987654321)
				<>AutoProc:=0
				USE NAMED SELECTION:C332("◊IA")
				$_t_Search:="◊IA"
			Else 
				If ((<>SD3_at_HistoryRelation>1) & (vAutofind))
					GOTO RECORD:C242([PERSONNEL:11]; <>AutoProc)
					Diary_HistSrch
					<>SD3_at_HistoryRelation:=1
					<>AutoProc:=0
				Else 
					vSelPrev:=$_t_Search
					If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
						ALL RECORDS:C47([PERSONNEL:11])
					Else 
						
						If ($_t_Search="Contact: @")
							$_t_Search:=Substring:C12($_t_Search; 10; 32000)
							QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=$_t_Search)
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
													GOTO RECORD:C242([PERSONNEL:11]; <>AutoProc)
													<>AutoProc:=0
												Else 
													$D:=Diary_SelDate($_t_Search)
													If ($D>!1990-01-01!)
														//         If ($D>=◊CDate)
														QUERY:C277([DIARY:12]; [DIARY:12]Date_Do_To:33>=$D; *)
														QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4<=$D; *)
														//       Else
														QUERY:C277([DIARY:12];  | ; [DIARY:12]Date_Done_To:34>=$D; *)
														QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_From:5<=$D)
														//      End if
													Else 
														$D:=!00-00-00!
													End if 
													If ((Records in selection:C76([DIARY:12])=0) | ($D=!00-00-00!))
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
				Sel_FindMy(->[PERSONNEL:11]; ->[PERSONNEL:11]Name:2)
			End if 
		Else 
			Diary_SelP
		End if 
		If ((DB_t_CurrentFormUsage="Time") & (Records in selection:C76([DIARY:12])>0))
			QUERY SELECTION:C341([PERSONNEL:11]; [DIARY:12]Action_Code:9=<>TimeAct)
		End if 
	Else 
		vD:=0
	End if 
End if 
If ((Records in selection:C76([PERSONNEL:11])>0) & (OK=1) & ($_t_Search#"◊IA"))
	Diary_SelCheck
End if 
ERR_MethodTrackerReturn("SuperDiary_Sel"; $_t_oldMethodName)