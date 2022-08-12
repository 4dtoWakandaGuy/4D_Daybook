//%attributes = {}
If (False:C215)
	//Project Method Name:      CON_ContactFindDuplicates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     15/10/2010 13:11
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_Status)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	//ARRAY TEXT(SVS_at_PreviewTypeN;0)
	C_BOOLEAN:C305($_bo_Update; WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_ContactsIndex; $_l_CurrentRow; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowReferenceRow; $_l_WindowRight; $_l_windowTop; ch1; ch2; ch3; ch4)
	C_LONGINT:C283(ch5; ch6; ch7; ch8; DB_l_CurrentDisplayedForm; DB_l_MaxRecords; r1; r2; vNo; vNo1; vNo2)
	C_LONGINT:C283(vNo3; vNo4; vNo5; vYear1; vYear2; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_ContactCode; $_t_ContactsCode; $_t_ForeName; $_t_FormTitle; $_t_oldMethodName; $_t_Surname; DB_t_CurrentContext; vCompany; vEvent; vPostcode; vTel)
	C_TEXT:C284(vTown)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CON_ContactFindDuplicates")

Gen_Confirm("Do you want to find all Contacts that have not been checked, or to "+"use the current selection?"; "Not checked"; "Selected")

If (OK=1)
	CREATE SET:C116([CONTACTS:1]; "$Temp")
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]Duplicate_State:26="")
Else 
	CREATE SET:C116([CONTACTS:1]; "$Temp")
	
	If (Records in set:C195("ListboxSet0")>0)
		USE SET:C118("ListboxSet0")
	End if 
End if 
If (Records in selection:C76([CONTACTS:1])=1)
	Gen_Alert("You need to select more than one contact to check for duplicates")
	
End if 
If (Records in selection:C76([CONTACTS:1])>1)
	vNo1:=10
	vNo2:=10
	vNo3:=10
	vNo4:=4
	vNo5:=4
	vYear1:=1
	vYear2:=6
	Open_AnyTypeWindow(291; 303; 5; $_t_FormTitle)
	DIALOG:C40("dCont_Dedup")
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	If (OK=1)
		
		ORDER BY:C49([CONTACTS:1]; [CONTACTS:1]Surname:5; >; [CONTACTS:1]Forename:4; >)
		Open_Pro_Window($_t_FormTitle)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowLeft+300; $_l_windowTop+80)
		
		
		CREATE EMPTY SET:C140([CONTACTS:1]; "$Master")
		UNLOAD RECORD:C212([CONTACTS:1])
		READ WRITE:C146([CONTACTS:1])
		StartTransaction
		
		FIRST RECORD:C50([CONTACTS:1])
		While (Not:C34(End selection:C36([CONTACTS:1])))
			
			If ([CONTACTS:1]Surname:5#"")
				GOTO XY:C161(0; 0)
				MESSAGE:C88(" "*32000)
				GOTO XY:C161(0; 0)
				MESSAGE:C88([CONTACTS:1]Contact_Name:31+" ")
				If (ch7=1)
					$_t_Surname:=("«««"*(Num:C11(([CONTACTS:1]Surname:5="") & (ch8=0))))+Substring:C12([CONTACTS:1]Surname:5; 1; vYear2)+"@"
				Else 
					$_t_Surname:="@"
				End if 
				$_t_ForeName:=("«««"*(Num:C11(([CONTACTS:1]Forename:4="") & (ch8=0))))+Substring:C12([CONTACTS:1]Forename:4; 1; vYear1)+"@"
				$_t_ContactCode:=[CONTACTS:1]Contact_Code:2
				QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
				QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
				
				If ((r2=0) | (Records in selection:C76([CONTACTS_COMPANIES:145])=1))
					RELATE ONE:C42([CONTACTS:1]Company_Code:1)
					vCompany:=Substring:C12([COMPANIES:2]Company_Name:2; 1; vNo1)+("«««"*(Num:C11(([COMPANIES:2]Company_Name:2="") & (ch8=0))))
					vEvent:=Substring:C12([COMPANIES:2]Address_Line_one:3; 1; vNo2)+("«««"*(Num:C11(([COMPANIES:2]Address_Line_one:3="") & (ch8=0))))
					vTown:=Substring:C12([COMPANIES:2]Town_or_City:5; 1; vNo3)+("«««"*(Num:C11(([COMPANIES:2]Town_or_City:5="") & (ch8=0))))
					vPostcode:=Substring:C12([COMPANIES:2]Postal_Code:7; 1; vNo4)+("«««"*(Num:C11(([COMPANIES:2]Postal_Code:7="") & (ch8=0))))
					vTel:=Substring:C12([COMPANIES:2]Telephone:9; 1; vNo5)+("«««"*(Num:C11(([COMPANIES:2]Telephone:9="") & (ch8=0))))
					vNo:=1
				Else 
					Array_LCx(vNo)
					ARRAY TEXT:C222(SVS_at_PreviewTypeN; vNo)
					
					$_l_CurrentRow:=1
					FIRST RECORD:C50([CONTACTS_COMPANIES:145])
					While (Not:C34(End selection:C36([CONTACTS_COMPANIES:145])))
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
						
						//RELATE ONE([CONTACTS_COMPANIES]Company Code)
						GEN_at_Name{$_l_CurrentRow}:=Substring:C12([COMPANIES:2]Company_Name:2; 1; vNo1)+("«««"*(Num:C11(([COMPANIES:2]Company_Name:2="") & (ch8=0))))
						GEN_at_Identity{$_l_CurrentRow}:=Substring:C12([COMPANIES:2]Town_or_City:5; 1; vNo3)+("«««"*(Num:C11(([COMPANIES:2]Town_or_City:5="") & (ch8=0))))
						GEN_at_RecordCode{$_l_CurrentRow}:=Substring:C12([COMPANIES:2]Postal_Code:7; 1; vNo4)+("«««"*(Num:C11(([COMPANIES:2]Postal_Code:7="") & (ch8=0))))
						SVS_at_PreviewTypeN{$_l_CurrentRow}:=Substring:C12([COMPANIES:2]Telephone:9; 1; vNo5)+("«««"*(Num:C11(([COMPANIES:2]Telephone:9="") & (ch8=0))))
						$_l_CurrentRow:=$_l_CurrentRow+1
						NEXT RECORD:C51([CONTACTS_COMPANIES:145])
					End while 
					
					
				End if 
				
				CUT NAMED SELECTION:C334([CONTACTS:1]; "$Sel")
				
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Surname:5=$_t_Surname; *)
				If (ch6=1)
					QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Forename:4=$_t_ForeName; *)
				End if 
				QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Contact_Code:2#$_t_ContactCode)
				If ((ch1=1) | (ch2=1) | (ch3=1) | (ch4=1) | (ch5=1))
					QUERY SELECTION BY FORMULA:C207([CONTACTS:1]; Cont_Dedup2Src)
				End if 
				
				If (Records in selection:C76([CONTACTS:1])>0)
					$_bo_Update:=True:C214
					$_t_ContactsCode:=[CONTACTS:1]Contact_Code:2
					CREATE SET:C116([CONTACTS:1]; "$Extra")
					UNION:C120("$Master"; "$Extra"; "$Master")
					DIFFERENCE:C122("$Extra"; "$Master"; "$Extra")
					USE SET:C118("$Extra")
					If (Not:C34(In transaction:C397))
						DB_lockFile(->[CONTACTS:1])
						APPLY TO SELECTION:C70([CONTACTS:1]; [CONTACTS:1]Comments:10:=[CONTACTS:1]Comments:10+(Char:C90(13)*(Num:C11([CONTACTS:1]Comments:10#"")))+String:C10(<>DB_d_CurrentDate; 1)+"  Duplicate of "+$_t_ContactCode)
						
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[CONTACTS:1]))
					Else 
						FIRST RECORD:C50([CONTACTS:1])
						For ($_l_ContactsIndex; 1; Records in selection:C76([CONTACTS:1]))
							[CONTACTS:1]Comments:10:=[CONTACTS:1]Comments:10+(Char:C90(13)*(Num:C11([CONTACTS:1]Comments:10#"")))+String:C10(<>DB_d_CurrentDate; 1)+"  Duplicate of "+$_t_ContactCode
							DB_SaveRecord(->[CONTACTS:1])
							AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
							NEXT RECORD:C51([CONTACTS:1])
						End for 
					End if 
					USE NAMED SELECTION:C332("$Sel")
					ADD TO SET:C119([CONTACTS:1]; "$Master")
				Else 
					$_bo_Update:=False:C215
					USE NAMED SELECTION:C332("$Sel")
				End if 
				
				If ($_bo_Update)
					[CONTACTS:1]Comments:10:=[CONTACTS:1]Comments:10+(Char:C90(13)*(Num:C11([CONTACTS:1]Comments:10#"")))+String:C10(<>DB_d_CurrentDate; 1)+"  Duplicate of "+$_t_ContactsCode
				End if 
				If (([CONTACTS:1]Duplicate_State:26="") | (r1=1))
					If ($_bo_Update)
						[CONTACTS:1]Duplicate_State:26:="D"
						DB_SaveRecord(->[CONTACTS:1])
						AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
					Else 
						[CONTACTS:1]Duplicate_State:26:="C"
						DB_SaveRecord(->[CONTACTS:1])
						AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
					End if 
				Else 
					If ($_bo_Update)
						DB_SaveRecord(->[CONTACTS:1])
						AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
					End if 
				End if 
			Else 
				GOTO XY:C161(0; 0)
				MESSAGE:C88(" "*32000)
				GOTO XY:C161(0; 0)
				MESSAGE:C88([CONTACTS:1]Contact_Code:2+" ")
				If (([CONTACTS:1]Duplicate_State:26="") | (r1=1))
					[CONTACTS:1]Duplicate_State:26:="C"
					DB_SaveRecord(->[CONTACTS:1])
					AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
				End if 
			End if 
			
			NEXT RECORD:C51([CONTACTS:1])
			
		End while 
		
		USE SET:C118("$Master")
		If (Records in selection:C76([CONTACTS:1])=0)
			Gen_Alert("No duplicate Contacts found"; "")
			USE SET:C118("$temp")
			DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		Else 
			vNo:=Records in selection:C76([CONTACTS:1])
			ORDER BY:C49([CONTACTS:1]Surname:5; >; [CONTACTS:1]Forename:4; >)
			READ WRITE:C146([CONTACTS:1])
			DB_l_MaxRecords:=Records in selection:C76([CONTACTS:1])
			SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
			DB_SetFormMenuoptions
		End if 
		//This message needs to display when we close the window
		
		//Gen_Confirm ("Do you want to save any changes to the Duplicate State and Comments fields"+", and to confirm any deletions made?";"Yes";"No")
		//Transact_End
		
	Else 
		USE SET:C118("$temp")
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
	End if 
	
Else 
	USE SET:C118("$temp")
	DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	DB_SetFormMenuoptions
End if 
ERR_MethodTrackerReturn("CON_ContactFindDuplicates"; $_t_oldMethodName)
