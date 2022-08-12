//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Mail Diary
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   14/06/2010 15:25
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(cList; rDiary; vD; vNo; vNo2; vP)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_CurrentOutputform; $_t_oldMethodName; $_t_Search; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail Diary")
//Mail Diary
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
Start_ProcMail
If (Diary_FileL)
	FORM SET OUTPUT:C54([DIARY:12]; "Diary Out")
	WIN_t_CurrentOutputform:="Diary Out"
	READ ONLY:C145([COMPANIES:2])
	READ ONLY:C145([CONTACTS:1])
	rDiary:=1
	While (vD=1)
		If (DB_t_CurrentFormUsage#"Button")
			$_t_Search:="To Do"
			If (DB_t_CurrentFormUsage#"MergeSp")
				$_t_Search:=Substring:C12(Sel_AtSign(Gen_Request("Find all Documents To Do (or type a Code)?"; $_t_Search; "OK"; "Find Others")); 1; 51)
				If (OK=1)
					If (($_t_Search="To Do@") | ($_t_Search=""))
						QUERY:C277([DIARY:12]; [DIARY:12]Done:14=False:C215; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Document_Code:15#""; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4<=<>DB_d_CurrentDate)
					Else 
						QUERY:C277([DIARY:12]; [DIARY:12]Done:14=False:C215; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Document_Code:15=$_t_Search; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4<=<>DB_d_CurrentDate)
					End if 
				Else 
					
					Diary_Sel
				End if 
			Else 
				Diary_Sel
			End if 
		End if 
		If (vD=1)
			If (Records in selection:C76([DIARY:12])>0)
				OK:=1
				If (DB_t_CurrentFormUsage#"Button")
					vNo:=Records in selection:C76([DIARY:12])
					vNo2:=vNo
					ORDER BY:C49([DIARY:12]; [DIARY:12]Company_Code:1; >; [DIARY:12]Document_Code:15; >)
					DB_t_CurrentFormUsage:="Print"
					Open_Pro_Window("Mail Diary"; 0; 1; ->[DIARY:12]; WIN_t_CurrentOutputform)
					FS_SetFormSort(WIN_t_CurrentOutputform)
					WIn_SetFormSize(1; ->[DIARY:12]; WIN_t_CurrentOutputform)
					DISPLAY SELECTION:C59([DIARY:12]; *)
					If (OK=1)
						vNo:=Records in selection:C76([DIARY:12])
						If (vNo2#vNo)
							ORDER BY:C49([DIARY:12]; [DIARY:12]Company_Code:1; >; [DIARY:12]Document_Code:15; >)
						End if 
					End if 
				End if 
				$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
				If (OK=1)
					MAsk_Print(->[DIARY:12])
					
					
					If (vP=1)  //Print OK
						MAsk_MS(->[DIARY:12])  //mail sort
						If (OK=1)
							If (cList=1)
								FORM SET OUTPUT:C54([DIARY:12]; "Diary_ListM")
								MList_Print(->[DIARY:12])  //Print list-includes email setup
							End if 
							MailP_Let(->[DIARY:12])
							MailP_Lab(->[DIARY:12])
							MailP_Env(->[DIARY:12])
							MailP_Exp(->[DIARY:12])
						End if 
					End if 
				End if 
				If ($_t_CurrentFormUsage#"Button")
					Close_ProWin
				End if 
				vD:=0
			Else 
				Gen_None("Diary Items"; ->vD)
			End if 
		End if 
	End while 
End if 

Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Mail Diary"; $_t_oldMethodName)
