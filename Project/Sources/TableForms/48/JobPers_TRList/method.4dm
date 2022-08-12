If (False:C215)
	//Table Form Method Name: [JOB PERSONNEL]JobPers_TRLIst
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2009 13:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(s3; s4)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [JOB PERSONNEL].JobPers_TRLIst"; Form event code:C388)

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)
		QUERY:C277([DIARY:12]; [DIARY:12]Job_Code:19=[JOBS:26]Job_Code:1; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Stage_Code:21=[JOB PERSONNEL:48]Stage_Code:2; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Person:8=[JOB PERSONNEL:48]Person:3; *)
		If ((s3=1) & (s4=0))
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Done:14=False:C215; *)
		Else 
			If ((s4=1) & (s3=0))
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Done:14=True:C214; *)
			End if 
		End if 
		QUERY:C277([DIARY:12])
		ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Done_From:5; >)
End case 
ERR_MethodTrackerReturn("FM [JOB PERSONNEL].JobPers_TRLIst"; $_t_oldMethodName)
