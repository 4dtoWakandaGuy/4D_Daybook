//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Comp ST Update
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_AnalysisCode; $_t_Comment; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp ST Update")
$_t_Comment:=[COMPANIES:2]Comments:30
While (Length:C16($_t_Comment)>0)
	IDLE:C311  // 03/04/03 pb
	$_t_AnalysisCode:=Substring:C12(First_Field(->$_t_Comment; "+"); 1; 51)
	If ($_t_AnalysisCode#"")
		CREATE RECORD:C68([COMPANIES_RECORD_ANALYSIS:146])
		[COMPANIES_RECORD_ANALYSIS:146]Company_Code:4:=[COMPANIES:2]Company_Code:1
		//[COMPANIES_FURTHERS]id_added_by_converter:=
		[COMPANIES_RECORD_ANALYSIS:146]Analysis_Code:1:=RemoveLead(RemoveTrail2(Uppercase:C13($_t_AnalysisCode)))
		[COMPANIES_RECORD_ANALYSIS:146]Company_ID:3:=[COMPANIES:2]x_ID:63
		SAVE RECORD:C53([COMPANIES_RECORD_ANALYSIS:146])
		
	End if 
End while 
ERR_MethodTrackerReturn("Comp ST Update"; $_t_oldMethodName)