//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary Alloc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/11/2010 14:15
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_DiaryRecordNumber; vC; vD; vNo)
	C_TEXT:C284($_t_CurrentOutputform; $_t_DiaryDescription; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary Alloc")
//Diary Alloc
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Menu_Record("Diary Alloc"; "Allocate to Companies")
If (Modified record:C314([DIARY:12]))
	Diary_PersPrior
	DB_SaveRecord(->[DIARY:12])
	AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
End if 
Gen_Confirm("Please select the Companies for allocation")
If (OK=1)
	CREATE SET:C116([DIARY:12]; "D2Master")
	PUSH RECORD:C176([DIARY:12])
	$_l_DiaryRecordNumber:=Record number:C243([DIARY:12])
	//DEFAULT TABLE([COMPANIES])
	vC:=1
	Comp_SelP
	vC:=0
	vD:=1
	If (OK=1)
		//DB_t_CurrentFormUsage:="Select"
		//OUTPUT FORM([COMPANIES];"Companies Out")
		//vNo:=Records in selection([COMPANIES])
		//WIN_t_CurrentOutputform:="Companies Out"
		//Open_Pro_Window ("Select Companies";0;1;->[COMPANIES];WIN_t_CurrentOutputform)
		//NG may 2004 added form name to above
		//FS_SetFormSort (WIN_t_CurrentOutputform)
		//WIn_SetFormSize (1;->[COMPANIES];WIN_t_CurrentOutputform)
		//D`ISPLAY SELECTION([COMPANIES];*)
		//Close_ProWin
		//Userset
		//DEFAULT TABLE([DIARY])
		DBI_MenuSelectRecords(Table name:C256(Table:C252(->[COMPANIES:2])); True:C214)
		
		Gen_Confirm("Allocate to "+String:C10(Records in selection:C76([COMPANIES:2]))+" Companies?"; "Yes"; "No")
		If (OK=1)
			GOTO RECORD:C242([DIARY:12]; $_l_DiaryRecordNumber)
			$_t_DiaryDescription:=[DIARY:12]Action_Details:10
			FIRST RECORD:C50([COMPANIES:2])
			While (Not:C34(End selection:C36([COMPANIES:2])))
				DUPLICATE RECORD:C225([DIARY:12])
				[DIARY:12]x_ID:50:=0
				
				Diary_Code
				[DIARY:12]Company_Code:1:=[COMPANIES:2]Company_Code:1
				Cont_DefRoleSrc
				[DIARY:12]Contact_Code:2:=[CONTACTS:1]Contact_Code:2
				[DIARY:12]Action_Details:10:="ALLOCATION: "+$_t_DiaryDescription
				DB_SaveRecord(->[DIARY:12])
				AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
				ADD TO SET:C119([DIARY:12]; "D2Master")
				NEXT RECORD:C51([COMPANIES:2])
			End while 
		End if 
	End if 
	//DEFAULT TABLE([DIARY])
	DB_t_CurrentFormUsage:=""
	USE SET:C118("D2Master")
	POP RECORD:C177([DIARY:12])
End if 
Diary_Title
vNo:=Records in selection:C76([DIARY:12])
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Diary Alloc"; $_t_oldMethodName)