If (False:C215)
	//Table Form Method Name: [DIARY]Diary_SubPP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vDesc1; vDesc2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY].Diary_SubPP"; Form event code:C388)
//Diary_SubPP
RELATE ONE:C42([DIARY:12]Action_Code:9)
RELATE ONE:C42([DIARY:12]Result_Code:11)
RELATE ONE:C42([DIARY:12]Product_Code:13)
If (Length:C16([DIARY:12]Action_Details:10)>100)
	vDesc1:=RemoveTrailCR(Substring:C12([DIARY:12]Action_Details:10; 1; 100))+" ..."
Else 
	vDesc1:=RemoveTrailCR([DIARY:12]Action_Details:10)
End if 
If (Length:C16([DIARY:12]Result_Description:12)>100)
	vDesc2:=RemoveTrailCR(Substring:C12([DIARY:12]Result_Description:12; 1; 100))+" ..."
Else 
	vDesc2:=RemoveTrailCR([DIARY:12]Result_Description:12)
End if 
ERR_MethodTrackerReturn("FM [DIARY].Diary_SubPP"; $_t_oldMethodName)
