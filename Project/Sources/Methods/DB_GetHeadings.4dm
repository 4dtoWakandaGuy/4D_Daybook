//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetHeadings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   09/01/2011 13:23 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_HeadingCodes; 0)
	ARRAY TEXT:C222($_at_HeadingNames; 0)
	//ARRAY TEXT(DB_at_HeadingCodes;0)
	//ARRAY TEXT(DB_at_HeadingNames;0)
	C_BOOLEAN:C305(DB_bo_HeadingsReady)
	C_LONGINT:C283($_l_BlankRow; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetHeadings")
If (Count parameters:C259>=1)
	READ ONLY:C145([HEADINGS:84])
	ALL RECORDS:C47([HEADINGS:84])
	
	SELECTION TO ARRAY:C260([HEADINGS:84]Heading_Code:1; $_at_HeadingCodes; [HEADINGS:84]Heading_Name:2; $_at_HeadingNames)
	
	$_l_BlankRow:=Find in array:C230($_at_HeadingCodes; "")
	If ($_l_BlankRow>0)
		DELETE FROM ARRAY:C228($_at_HeadingCodes; $_l_BlankRow)
		DELETE FROM ARRAY:C228($_at_HeadingNames; $_l_BlankRow)
	End if 
	VARIABLE TO VARIABLE:C635($1; DB_at_HeadingNames; $_at_HeadingNames; DB_at_HeadingCodes; $_at_HeadingCodes)
	SET PROCESS VARIABLE:C370($1; DB_bo_HeadingsReady; True:C214)
End if 
ERR_MethodTrackerReturn("DB_GetHeadings"; $_t_oldMethodName)