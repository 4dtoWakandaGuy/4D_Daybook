//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_Sel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/02/2012 12:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SD3_at_HistoryRelation;0)
	C_BOOLEAN:C305(<>SelOr; $2; $3)
	C_DATE:C307($_d_Date)
	C_LONGINT:C283(<>AutoProc; $_l_GetFieldNames; $_l_LastField; $_l_position; $_l_SearchFieldNumber; $_l_TableNumber)
	C_POINTER:C301($_Ptr_Field; $_Ptr_Table)
	C_TEXT:C284($_t_After; $_t_Before; $_t_FieldName; $_t_FieldName2; $_t_oldMethodName; $_t_Search; $_t_SearchAt; $_t_SearchWithWIldCard; $1; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2)
	C_TEXT:C284(DB_t_CurrentFormUsage3; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_Sel2")
If (Count parameters:C259>=1)
	$_t_Search:=$1
Else 
	$_t_Search:=""
End if 
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
		//************************************************** changed to avoid destination string error - kmw 10/11/08 v631b120e ***********************************************
		//vSelPrev:=$_t_Search
		//Obviously this is not ideal and probably better to change vSelPrev to TYPE Text. However, unfortunately this var is used extensively throughout system and not sure on effect of changing its type would be - at least this quick fix for the time being is better than it was.
		If (Length:C16($_t_Search)>51)
			vSelPrev:=Substring:C12($_t_Search; 51)
		Else 
			vSelPrev:=$_t_Search
		End if 
		//***********************************************************************************************************************************************************************
		If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
			ALL RECORDS:C47([DIARY:12])
			
		Else 
			$_l_position:=Position:C15(":"; $1)
			If ($_l_Position>0)
				$_t_Before:=Substring:C12($1; 1; $_l_position-1)
				$_t_After:=Substring:C12($1; $_l_position+1)
				$_l_TableNumber:=Table:C252(->[DIARY:12])
				$_l_LastField:=Get last field number:C255(Table:C252(->[DIARY:12]))
				For ($_l_GetFieldNames; 1; $_l_LastField)
					If (Is field number valid:C1000($_l_TableNumber; $_l_GetFieldNames))
						$_t_FieldName:=Field name:C257($_l_TableNumber; $_l_GetFieldNames)
						$_t_FieldName2:=Replace string:C233($_t_FieldName; "_"; " ")
						If ($_t_FieldName=$_t_Before) | ($_t_FieldName2=$_t_Before)
							
							$_l_SearchFieldNumber:=$_l_GetFieldNames
							$_l_GetFieldNames:=$_l_LastField
						End if 
					End if 
				End for 
			End if 
			
			Case of 
				: ($_t_Search="Contact: @")
					$_t_Search:=Substring:C12($_t_Search; 10; 32000)
					QUERY:C277([DIARY:12]; [DIARY:12]Contact_Code:2=$_t_Search)
				: ($_l_SearchFieldNumber>0)
					$_t_SearchWithWIldCard:=Sel_AtSign($_t_after)
					$_Ptr_Table:=Table:C252($_l_TableNumber)
					$_Ptr_Field:=Field:C253($_l_TableNumber; $_l_SearchFieldNumber)
					QUERY:C277($_Ptr_Table->; $_Ptr_Field->=$_t_after)
					If (Records in selection:C76($_Ptr_Table->)=0)
						QUERY:C277($_Ptr_Table->; $_Ptr_Field->=$_t_SearchWithWIldCard)
					End if 
					
					
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
								If ($_t_Search="Diary: @") | ($_t_Search="Diary Code: @")
									If ($_t_Search="Diary Code: @")  //added 04/07/08 -kmw (previously was allowing "Diary Code: @" but not taking that into account for substring)
										$_t_Search:=Substring:C12($_t_Search; 13; 32000)  //added 04/07/08 -kmw (previously was allowing "Diary Code: @" but not taking that into account for substring)
									Else   //added 04/07/08 -kmw (previously was allowing "Diary Code: @" but not taking that into account for substring)
										$_t_Search:=Substring:C12($_t_Search; 8; 32000)
									End if   //added 04/07/08 -kmw (previously was allowing "Diary Code: @" but not taking that into account for substring)
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
											$_d_Date:=Diary_SelDate($_t_Search)
											If ($_d_Date>!1990-01-01!)
												//         If ($_d_Date>=◊CDate)
												QUERY:C277([DIARY:12]; [DIARY:12]Date_Do_To:33>=$_d_Date; *)
												QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4<=$_d_Date; *)
												//       Else
												QUERY:C277([DIARY:12];  | ; [DIARY:12]Date_Done_To:34>=$_d_Date; *)
												QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_From:5<=$_d_Date)
												//      End if
											Else 
												$_d_Date:=!00-00-00!
											End if 
											If ((Records in selection:C76([DIARY:12])=0) | ($_d_Date=!00-00-00!))
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
																		SelOr_2(->[DIARY:12])
																		If ((Records in selection:C76([DIARY:12])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
																			Sel_NoAtAt(->[DIARY:12]; ->[DIARY:12]Action_Code:9; $_t_Search; $_t_SearchAt)
																			SelOr_2(->[DIARY:12])
																			If ((Records in selection:C76([DIARY:12])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
																				Sel_NoAtAt(->[DIARY:12]; ->[DIARY:12]Result_Code:11; $_t_Search; $_t_SearchAt)
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
			End case 
			
		End if 
	End if 
	QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Deleted:43=0)
	Sel_FindMy(->[DIARY:12]; ->[DIARY:12]Person:8; ->[DIARY:12]Originator:23)
End if 
//Any filters??
ERR_MethodTrackerReturn("Diary_Sel2"; $_t_oldMethodName)