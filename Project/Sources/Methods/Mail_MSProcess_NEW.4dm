//%attributes = {}
If (False:C215)
	//Project Method Name:      Mail_MSProcess_NEW
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:15
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(MS_al_ComRecNo;0)
	//ARRAY LONGINT(MS_al_OtherRecNos;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY TEXT(MS_at_MailSortSSC;0)
	//ARRAY TEXT(MS_at_MailSortSSCUnique;0)
	//ARRAY TEXT(MS_at_MailSortOFN;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_CompanyIndex; $_l_CompanyNextRow; $_l_CurrentRow; $_l_Index; $_l_Index2; $_l_MailsortRow; $_l_Residue; $_l_Sort; $_l_SubCount; $_l_WindowReferenceRow)
	C_LONGINT:C283(ch3; ch4; MS_MailID; rComp; rState; vNo3; vNo4; vNo5; vSNo; WIN_l_CurrentWinRef; zComp)
	C_REAL:C285($_r_Weight; vDiscountF; vValueF; vValueT)
	C_TEXT:C284($_Ptr_ListBox; $_t_oldMethodName; $_t_SSC; $_t_SSC2; $_t_SSC3; vArea)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail_MSProcess_NEW")
//Mail_MSProcess

MESSAGES OFF:C175
Open_PrD_Window("Mailsort: Command-. to Cancel")
MESSAGE:C88(Char:C90(13)+"  MAILSORT PROCESSING STAGE:"+Char:C90(13)+Char:C90(13))

Gen_Confirm("Would you like to keep this mailing to retreive later")
If (OK=1)
	MS_MailID:=AA_GetNextIDinMethod(->MS_MailID)
Else 
	MS_MailID:=0
	READ WRITE:C146([MAILSORT_MAIL:83])
	ALL RECORDS:C47([MAILSORT_MAIL:83])
	MESSAGE:C88("  Deleting Previous Mailsort Calculations"+Char:C90(13)+Char:C90(13))
	DELETE SELECTION:C66([MAILSORT_MAIL:83])
End if 
If (<>SYS_l_CancelProcess#Current process:C322)
	If ((rComp=0) & (rState#2))
		MESSAGE:C88("  Linking to Companies"+Char:C90(13)+Char:C90(13))
		ARRAY LONGINT:C221(MS_al_OtherRecNos; Records in selection:C76)
		ARRAY LONGINT:C221(MS_al_ComRecNo; Records in selection:C76)
		ARRAY TEXT:C222(MS_at_MailSortSSC; Records in selection:C76)
		ARRAY TEXT:C222(MS_at_MailSortOFN; Records in selection:C76)
		
		CREATE EMPTY SET:C140([COMPANIES:2]; "Master")
		$_l_Index:=1
		FIRST RECORD:C50
		For ($_l_Index; 1; Records in selection:C76)
			If (<>SYS_l_CancelProcess#Current process:C322)
				Mail_MSRel
				MS_al_OtherRecNos{$_l_Index}:=Record number:C243
				MS_al_ComRecNo{$_l_Index}:=Record number:C243([COMPANIES:2])
				MS_at_MailSortSSC{$_l_Index}:=[COMPANIES:2]Mailsort_SSC:49
				MS_at_MailSortOFN{$_l_Index}:=[COMPANIES:2]Mailsort_OFN:50
				
				ADD TO SET:C119([COMPANIES:2]; "Master")
				
				NEXT RECORD:C51
			Else 
				$_l_Index:=Records in selection:C76
			End if 
		End for 
		USE SET:C118("Master")
	End if 
	
	vNo3:=0
	vNo4:=0
	vNo5:=0
	If (<>SYS_l_CancelProcess#Current process:C322)
		MESSAGE:C88("  Calculating Mailsort Order for "+String:C10(Records in selection:C76([COMPANIES:2]))+" Companies ..."+Char:C90(13)+Char:C90(13))
		SORT ARRAY:C229(MS_at_MailSortSSC; MS_al_ComRecNo; MS_al_OtherRecNos)
		ORDER BY:C49([COMPANIES:2]; [COMPANIES:2]Mailsort_SSC:49; >)
		ARRAY TEXT:C222(MS_at_MailSortSSCUnique; Size of array:C274(MS_at_MailSortSSC))
		$_l_CurrentRow:=0
		For ($_l_Index; 1; Size of array:C274(MS_at_MailSortSSC))
			If (<>SYS_l_CancelProcess#Current process:C322)
				$_t_SSC:=MS_at_MailSortSSC{$_l_Index}
				$_t_SSC3:=MS_at_MailSortSSC{$_l_Index}
				$_l_MailsortRow:=Find in array:C230(MS_at_MailSortSSCUnique; $_t_SSC)
				//````
				If ($_l_MailsortRow<0)
					$_l_CurrentRow:=$_l_CurrentRow+1
					MS_at_MailSortSSCUnique{$_l_CurrentRow}:=MS_at_MailSortSSC{$_l_Index}
					If (($_t_SSC="") | ($_t_SSC="00000") | (vArea="") | (Length:C16(vArea)>1) | (ch4=0))
						$_l_Sort:=99
					Else 
						$_Ptr_ListBox:=Substring:C12($_t_SSC; 1; 3)
						QUERY:C277([MAILSORT_B:78]; [MAILSORT_B:78]Record_Type:1="3"; *)
						QUERY:C277([MAILSORT_B:78];  & ; [MAILSORT_B:78]SSC:2=$_Ptr_ListBox)
						If (Records in selection:C76([MAILSORT_B:78])=0)
							$_l_Sort:=98
						Else 
							$_l_Sort:=Num:C11(Substring:C12([MAILSORT_B:78]Sort_Sequence:4; vSNo; 2))
						End if 
					End if 
					
					If ((Substring:C12($_t_SSC; 4; 2)="00") & ($_t_SSC#"00000") & ($_t_SSC#""))
						$_t_SSC2:=Substring:C12($_t_SSC; 1; 3)+"XX"
						$_l_Residue:=1
					Else 
						If ($_t_SSC="")
							$_t_SSC2:="00000"
						Else 
							$_t_SSC2:=$_t_SSC
						End if 
						$_l_Residue:=0
					End if 
					//`````````````
					$_l_SubCount:=0
					For ($_l_Index2; $_l_Index; Size of array:C274(MS_at_MailSortSSC))
						If (MS_at_MailSortSSC{$_l_Index2}=$_t_SSC)
							//`````````````````````````````
							CREATE RECORD:C68([MAILSORT_MAIL:83])
							[MAILSORT_MAIL:83]SSC:3:=$_t_SSC2
							If ((rComp=0) & (rState#2))
								[MAILSORT_MAIL:83]Record_Number:1:=MS_al_OtherRecNos{$_l_Index2}
								//MS_al_ComRecNo{$_l_Index2}:=9999999
							Else 
								[MAILSORT_MAIL:83]Record_Number:1:=MS_al_ComRecNo{$_l_Index2}
							End if 
							[MAILSORT_MAIL:83]Residue:2:=$_l_Residue
							//[mailsort mail]postal code:=[companies]postal code
							[MAILSORT_MAIL:83]Area_Order:4:=$_l_Sort
							DB_SaveRecord(->[MAILSORT_MAIL:83])
							Mail_MSOFN(MS_at_MailSortOFN{$_l_Index2})
							
							If ((rComp=0) & (rState#2) & (zComp=0))  //More than one
								$_l_CompanyNextRow:=Find in array:C230(MS_al_ComRecNo; Record number:C243([COMPANIES:2]); $_l_Index2+1)
								If ($_l_CompanyNextRow>0)
									For ($_l_CompanyIndex; $_l_CompanyNextRow; Size of array:C274(MS_al_ComRecNo))
										If (MS_al_ComRecNo{$_l_CompanyIndex}=MS_al_ComRecNo{$_l_Index2})
											If (<>SYS_l_CancelProcess#Current process:C322)
												CREATE RECORD:C68([MAILSORT_MAIL:83])
												[MAILSORT_MAIL:83]SSC:3:=$_t_SSC2
												[MAILSORT_MAIL:83]Record_Number:1:=MS_al_OtherRecNos{$_l_CompanyIndex}
												// MS_al_ComRecNo{$_l_CompanyNextRow}:=9999999
												[MAILSORT_MAIL:83]Residue:2:=$_l_Residue
												//[mailsort mail]postal code:=[companies]postal code
												[MAILSORT_MAIL:83]Area_Order:4:=$_l_Sort
												DB_SaveRecord(->[MAILSORT_MAIL:83])
												$_l_SubCount:=$_l_SubCount+1
												Mail_MSOFN(MS_at_MailSortOFN{$_l_CompanyIndex})
											Else 
												$_l_CompanyIndex:=Size of array:C274(MS_al_ComRecNo)
											End if 
										Else 
											$_l_CompanyIndex:=Size of array:C274(MS_al_ComRecNo)
										End if 
									End for 
									
									
								End if 
							End if 
						Else 
							$_l_Index2:=Size of array:C274(MS_at_MailSortSSC{$_l_Index2})
						End if 
						
						$_l_SubCount:=$_l_SubCount+1
					End for 
					
					
					If ($_l_Index<vDiscountF)
						$_t_SSC2:=Substring:C12($_t_SSC; 1; 3)+"XX"
						$_l_Residue:=1
						QUERY:C277([MAILSORT_MAIL:83]; [MAILSORT_MAIL:83]SSC:3=$_t_SSC2; *)
						QUERY:C277([MAILSORT_MAIL:83];  & ; [MAILSORT_MAIL:83]Record_Number:1=999999)
						If (Records in selection:C76([MAILSORT_MAIL:83])=0)
							CREATE RECORD:C68([MAILSORT_MAIL:83])
							[MAILSORT_MAIL:83]SSC:3:=$_t_SSC2
							[MAILSORT_MAIL:83]Record_Number:1:=999999
							[MAILSORT_MAIL:83]Residue:2:=$_l_Residue
							[MAILSORT_MAIL:83]Area_Order:4:=$_l_Sort
							[MAILSORT_MAIL:83]Count:5:=$_l_SubCount
							[MAILSORT_MAIL:83]Bags:6:=1
							DB_SaveRecord(->[MAILSORT_MAIL:83])
						Else 
							[MAILSORT_MAIL:83]Count:5:=[MAILSORT_MAIL:83]Count:5+$_l_SubCount
							DB_SaveRecord(->[MAILSORT_MAIL:83])
						End if 
						QUERY:C277([MAILSORT_MAIL:83]; [MAILSORT_MAIL:83]SSC:3=$_t_SSC3; *)
						QUERY:C277([MAILSORT_MAIL:83];  & ; [MAILSORT_MAIL:83]Record_Number:1#999999)
						DB_lockFile(->[MAILSORT_MAIL:83])
						APPLY TO SELECTION:C70([MAILSORT_MAIL:83]; [MAILSORT_MAIL:83]Residue:2:=$_l_Residue)
						
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[MAILSORT_MAIL:83]))
						
					Else 
						CREATE RECORD:C68([MAILSORT_MAIL:83])
						[MAILSORT_MAIL:83]SSC:3:=$_t_SSC2
						[MAILSORT_MAIL:83]Record_Number:1:=999999
						[MAILSORT_MAIL:83]Residue:2:=$_l_Residue
						[MAILSORT_MAIL:83]Area_Order:4:=$_l_Sort
						[MAILSORT_MAIL:83]Count:5:=$_l_SubCount
						[MAILSORT_MAIL:83]Bags:6:=1
						DB_SaveRecord(->[MAILSORT_MAIL:83])
					End if 
					
					//````````````
				Else 
					$_l_Index:=Size of array:C274(MS_at_MailSortSSC)
				End if 
				
				
			Else 
				$_l_Index:=Size of array:C274(MS_at_MailSortSSC)
			End if 
			
		End for 
		
		
		If (ch3=1)
			MESSAGE:C88("  Calculating Undersized Directs"+Char:C90(13)+Char:C90(13))
			QUERY:C277([MAILSORT_B:78]; [MAILSORT_B:78]Record_Type:1="3")
			FIRST RECORD:C50([MAILSORT_B:78])
			While ((Not:C34(End selection:C36([MAILSORT_B:78]))) & (<>SYS_l_CancelProcess#Current process:C322))
				QUERY:C277([MAILSORT_MAIL:83]; [MAILSORT_MAIL:83]Residue:2=1; *)
				QUERY:C277([MAILSORT_MAIL:83];  & ; [MAILSORT_MAIL:83]Record_Number:1#999999; *)
				QUERY:C277([MAILSORT_MAIL:83];  & ; [MAILSORT_MAIL:83]SSC:3=([MAILSORT_B:78]SSC:2+"@"))
				ORDER BY:C49([MAILSORT_MAIL:83]; [MAILSORT_MAIL:83]SSC:3; >)
				FIRST RECORD:C50([MAILSORT_MAIL:83])
				$_t_SSC:=[MAILSORT_MAIL:83]SSC:3
				LAST RECORD:C200([MAILSORT_MAIL:83])
				If (($_t_SSC=[MAILSORT_MAIL:83]SSC:3) & ($_t_SSC#"@XX"))
					$_t_SSC2:=Substring:C12([MAILSORT_MAIL:83]SSC:3; 1; 3)+"XX"
					DB_lockFile(->[MAILSORT_MAIL:83])
					APPLY TO SELECTION:C70([MAILSORT_MAIL:83]; [MAILSORT_MAIL:83]Residue:2:=0)
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[MAILSORT_MAIL:83]))
					QUERY:C277([MAILSORT_MAIL:83]; [MAILSORT_MAIL:83]SSC:3=$_t_SSC2; *)
					QUERY:C277([MAILSORT_MAIL:83];  & ; [MAILSORT_MAIL:83]Record_Number:1=999999)
					[MAILSORT_MAIL:83]SSC:3:=$_t_SSC
					[MAILSORT_MAIL:83]Residue:2:=0
					DB_SaveRecord(->[MAILSORT_MAIL:83])
				End if 
				NEXT RECORD:C51([MAILSORT_B:78])
			End while 
		End if 
		
		If (<>SYS_l_CancelProcess#Current process:C322)
			//Make Residue ones with Direct Codes have Residue Codes
			QUERY:C277([MAILSORT_MAIL:83]; [MAILSORT_MAIL:83]Residue:2=1; *)
			QUERY:C277([MAILSORT_MAIL:83];  & ; [MAILSORT_MAIL:83]Record_Number:1#999999; *)
			QUERY:C277([MAILSORT_MAIL:83];  & ; [MAILSORT_MAIL:83]SSC:3#"@XX")
			DB_lockFile(->[MAILSORT_MAIL:83])
			APPLY TO SELECTION:C70([MAILSORT_MAIL:83]; [MAILSORT_MAIL:83]SSC:3:=(Substring:C12([MAILSORT_MAIL:83]SSC:3; 1; 3)+"XX"))
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[MAILSORT_MAIL:83]))
			
			//Calculate Bags
			MESSAGE:C88("  Calculating Bag Sizes"+Char:C90(13)+Char:C90(13))
			QUERY:C277([MAILSORT_MAIL:83]; [MAILSORT_MAIL:83]Record_Number:1=999999)
			FIRST RECORD:C50([MAILSORT_MAIL:83])
			While ((Not:C34(End selection:C36([MAILSORT_MAIL:83]))) & (<>SYS_l_CancelProcess#Current process:C322))
				$_r_Weight:=(vValueT*[MAILSORT_MAIL:83]Count:5)/1000
				If ($_r_Weight>vValueF)
					If (Int:C8($_r_Weight/vValueF)=($_r_Weight/vValueF))
						[MAILSORT_MAIL:83]Bags:6:=Int:C8($_r_Weight/vValueF)
					Else 
						[MAILSORT_MAIL:83]Bags:6:=Int:C8($_r_Weight/vValueF)+1
					End if 
					DB_SaveRecord(->[MAILSORT_MAIL:83])
				End if 
				NEXT RECORD:C51([MAILSORT_MAIL:83])
			End while 
			
		End if 
	End if 
End if 
CLOSE WINDOW:C154
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 
MESSAGES ON:C181
ERR_MethodTrackerReturn("Mail_MSProcess_NEW"; $_t_oldMethodName)
