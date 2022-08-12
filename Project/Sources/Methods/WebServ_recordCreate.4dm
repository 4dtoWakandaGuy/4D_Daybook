//%attributes = {}
If (False:C215)
	//Project Method Name:      WebServ_recordCreate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604(DM_bl_Data)
	C_LONGINT:C283($_l_CatagoryRow; $_l_CodeRow; $_l_CompanyCodeRow; $_l_DateCodeRow; $_l_DetailsRow; $_l_EmailRow; $_l_EndMin; $_l_EndtHour; $_l_EndTimeRow; $_l_EndTimeRow2; $_l_EngineerRow)
	C_LONGINT:C283($_l_EscalateRow; $_l_LoanRow; $_l_LocationRow; $_l_MachineRow; $_l_NameRow; $_l_NFFRow; $_l_OtherRefRow; $_l_PartRow; $_l_ProblemRow; $_l_SerialRow; $_l_StartMin)
	C_LONGINT:C283($_l_StartTimeRow; $_l_StartTimeRow2; $_l_StatusRow)
	C_POINTER:C301($3; $4)
	C_TEXT:C284($_l_StartHour; $_t_DiaryCode; $_t_EndMin; $_t_EndtHour; $_t_oldMethodName; $_t_StartHour; $_t_StartMin; $1; $2; DM_t_DataSource)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WebServ_recordCreate")
//NG June 28 2006
//New Method
//This method will create a record in the process services table of type "DMWebReceive"
//the process services will then kick off the DM manager which will look for Processesto handl records and process them
//$1=The table name(By passing it as a string we can reject from here and bad calls to this method
//$2=The source page of the call(we will be looking for a data map relating to that source(being a specifc page)
//$3=Pointer to array of Variable names(we will use that for the data map)
//$4=Pointer to array of Variable values-which will go into the fields
START_SEMAPHORE("ProcessesToHandleQueue3")
Case of 
	: ($1="DIARY")
		SET BLOB SIZE:C606(DM_bl_Data; 0)
		DM_t_DataSource:=$2
		VARIABLE TO BLOB:C532(DM_t_DataSource; DM_bl_Data; *)
		VARIABLE TO BLOB:C532($3->; DM_bl_Data; *)
		VARIABLE TO BLOB:C532($4->; DM_bl_Data; *)
		//ProcessServices_CreateRecord (->[DIARY];->[DIARY]x_ID;"DMwebReceive";0;0;0;False;->DM_bl_Data)
		$_l_CodeRow:=Find in array:C230($3->; "mCallno")
		If ($_l_CodeRow>0)
			$_t_DiaryCode:=$4->{$_l_CodeRow}
			UNLOAD RECORD:C212([DIARY:12])
			READ WRITE:C146([DIARY:12])
			If ($_t_DiaryCode#"")
				QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_t_DiaryCode)
				If (Records in selection:C76([DIARY:12])=0)
					CREATE RECORD:C68([DIARY:12])
				End if 
			Else 
				CREATE RECORD:C68([DIARY:12])
				DiarySetCode
			End if 
			$_l_CompanyCodeRow:=Find in array:C230($3->; "mcompanyCode")
			If ($_l_CompanyCodeRow>0)
				[DIARY:12]Company_Code:1:=$4->{$_l_CompanyCodeRow}
			End if 
			$_l_DateCodeRow:=Find in array:C230($3->; "Date")
			If ($_l_DateCodeRow>0)
				[DIARY:12]Date_Done_From:5:=Date:C102($4->{$_l_DateCodeRow})
				[DIARY:12]Date_Done_To:34:=Date:C102($4->{$_l_DateCodeRow})
			End if 
			$_l_StartTimeRow:=Find in array:C230($3->; "StartHr")
			If ($_l_StartTimeRow>0)
				
				$_t_StartHour:=$4->{$_l_StartTimeRow}
				$_l_StartTimeRow2:=Find in array:C230($3->; "StartMin")
				If ($_l_StartTimeRow2>0)
					$_t_StartMin:=$4->{$_l_StartTimeRow2}
				Else 
					$_t_StartMin:="00"
				End if 
				[DIARY:12]Time_Done_From:7:=Time:C179($_t_StartHour+":"+$_t_StartMin+":"+"00")
			End if 
			$_l_EndTimeRow:=Find in array:C230($3->; "finHr")
			If ($_l_EndTimeRow>0)
				$_t_EndtHour:=$4->{$_l_EndTimeRow}
				$_l_EndTimeRow2:=Find in array:C230($3->; "finMin")
				If ($_l_EndTimeRow2>0)
					$_t_EndMin:=$4->{$_l_EndTimeRow2}
				Else 
					$_t_EndMin:="00"
				End if 
				[DIARY:12]Time_Done_To:36:=Time:C179($_t_EndtHour+":"+$_t_EndMin+":"+"00")
			End if 
			$_l_EngineerRow:=Find in array:C230($3->; "Engineer")
			
			If ($_l_EngineerRow>0)
				[DIARY:12]Person:8:=$4->{$_l_EngineerRow}
				//get the person ID Here
			End if 
			$_l_ProblemRow:=Find in array:C230($3->; "Problem")
			[DIARY:12]Action_Code:9:="®ENG"
			If ($_l_ProblemRow>0)
				[DIARY:12]Action_Details:10:=$4->{$_l_ProblemRow}
				$_l_MachineRow:=Find in array:C230($3->; "Machine Type")
				If ($_l_MachineRow>0)
					[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+Char:C90(13)+$4->{$_l_MachineRow}
				End if 
				$_l_SerialRow:=Find in array:C230($3->; "Serial")
				If ($_l_SerialRow>0)
					[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+Char:C90(13)+$4->{$_l_SerialRow}
				End if 
				$_l_OtherRefRow:=Find in array:C230($3->; "Other Reference")
				If ($_l_OtherRefRow>0)
					[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+Char:C90(13)+$4->{$_l_OtherRefRow}
				End if 
			End if 
			$_l_CatagoryRow:=Find in array:C230($3->; "Catagory")
			If ($_l_CatagoryRow>0)
				[DIARY:12]Result_Description:12:=$4->{$_l_CatagoryRow}
				$_l_DetailsRow:=Find in array:C230($3->; "Details")
				If ($_l_DetailsRow>0)
					[DIARY:12]Result_Description:12:=[DIARY:12]Result_Description:12+Char:C90(13)+$4->{$_l_DetailsRow}
				End if 
				$_l_LoanRow:=Find in array:C230($3->; "CheckBoxLoan")
				If ($_l_LoanRow>0)
					[DIARY:12]Result_Description:12:=[DIARY:12]Result_Description:12+Char:C90(13)+"Loan:"+$4->{$_l_LoanRow}
				End if 
				$_l_PartRow:=Find in array:C230($3->; "CheckBoxPart")
				If ($_l_PartRow>0)
					[DIARY:12]Result_Description:12:=[DIARY:12]Result_Description:12+Char:C90(13)+"Part:"+$4->{$_l_PartRow}
				End if 
				$_l_EscalateRow:=Find in array:C230($3->; "CheckboxEscalation")
				If ($_l_EscalateRow>0)
					[DIARY:12]Result_Description:12:=[DIARY:12]Result_Description:12+Char:C90(13)+"Escalate:"+$4->{$_l_EscalateRow}
				End if 
				$_l_NFFRow:=Find in array:C230($3->; "CheckboxNFF")
				If ($_l_NFFRow>0)
					[DIARY:12]Result_Description:12:=[DIARY:12]Result_Description:12+Char:C90(13)+"No Fault Found:"+$4->{$_l_NFFRow}
				End if 
				$_l_StatusRow:=Find in array:C230($3->; "Status")
				If ($_l_StatusRow>0)
					[DIARY:12]Result_Description:12:=[DIARY:12]Result_Description:12+Char:C90(13)+"Status:"+$4->{$_l_StatusRow}
				End if 
				$_l_NameRow:=Find in array:C230($3->; "textfieldname")
				If ($_l_NameRow>0)
					[DIARY:12]Result_Description:12:=[DIARY:12]Result_Description:12+Char:C90(13)+"Contact:"+$4->{$_l_NameRow}
				End if 
				$_l_EmailRow:=Find in array:C230($3->; "TextfieldEmail")
				If ($_l_EmailRow>0)
					[DIARY:12]Result_Description:12:=[DIARY:12]Result_Description:12+Char:C90(13)+"Contact_Email:"+$4->{$_l_EmailRow}
				End if 
				$_l_LocationRow:=Find in array:C230($3->; "Where")
				If ($_l_LocationRow>0)
					[DIARY:12]Result_Description:12:=[DIARY:12]Result_Description:12+Char:C90(13)+"Location:"+$4->{$_l_LocationRow}
				End if 
			End if 
			
			DB_SaveRecord(->[DIARY:12])
			UNLOAD RECORD:C212([DIARY:12])
			READ ONLY:C145([DIARY:12])
			
		End if 
		
	Else 
		//DO SOMETHING HERE
		
End case 
Stop_Semaphore("ProcessesToHandleQueue3")
ERR_MethodTrackerReturn("WebServ_recordCreate"; $_t_oldMethodName)
