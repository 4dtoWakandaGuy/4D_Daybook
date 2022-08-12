//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_DiaryDone
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(vNo)
	C_TEXT:C284($_t_oldMethodName; $_t_Result; vT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_DiaryDone")
//Diary_DiaryDone
If (Records in set:C195("Userset")>0)
	//This is deliberate - do not remove
	CREATE SET:C116([DIARY:12]; "DMaster")
	CUT NAMED SELECTION:C334([DIARY:12]; "$Diary")
	USE SET:C118("Userset")
	$_t_Result:="OK/"
	$_t_Result:=Gen_Request("Result/Description to assign:"; $_t_Result)
	If (OK=1)
		Are_You_Sure
		If (OK=1)
			vT:=$_t_Result
			$_t_Result:=Uppercase:C13(First_Field(->$_t_Result; "/"))
			FIRST RECORD:C50([DIARY:12])
			While (Not:C34(End selection:C36([DIARY:12])))
				[DIARY:12]Done:14:=True:C214
				[DIARY:12]Date_Done_From:5:=<>DB_d_CurrentDate
				[DIARY:12]Date_Done_To:34:=[DIARY:12]Date_Done_From:5
				[DIARY:12]Time_Done_From:7:=Current time:C178
				[DIARY:12]Time_Done_To:36:=[DIARY:12]Time_Done_From:7
				[DIARY:12]Result_Code:11:=Uppercase:C13($_t_Result)
				[DIARY:12]Result_Description:12:=vT
				[DIARY:12]Export:24:=Export_Stamp2([DIARY:12]Export:24)
				[DIARY:12]Personal_Priority:31:=""
				DB_SaveRecord(->[DIARY:12])
				AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
				Diary_InLPASeq("Result")
				NEXT RECORD:C51([DIARY:12])
			End while 
		End if 
	End if 
	USE NAMED SELECTION:C332("$Diary")
Else 
	$_t_Result:="OK"
	$_t_Result:=Uppercase:C13(Gen_Request("Result to view:"; $_t_Result))
	If (OK=1)
		COPY NAMED SELECTION:C331([DIARY:12]; "Diary")
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Result_Code:11=$_t_Result)
		If (Records in selection:C76([DIARY:12])=0)
			Gen_Alert("No Diary Items found for "+$_t_Result+" - the selection is unchanged"; "")
			USE NAMED SELECTION:C332("Diary")
		End if 
		CLEAR NAMED SELECTION:C333("Diary")
	End if 
End if 
vNo:=Records in selection:C76([DIARY:12])
ERR_MethodTrackerReturn("Diary_DiaryDone"; $_t_oldMethodName)