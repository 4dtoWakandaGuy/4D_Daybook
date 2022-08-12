//%attributes = {}
If (False:C215)
	//Project Method Name:      LoadDiaryAccess
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
	//ARRAY TEXT(<>MP_at_DiaryAcessInitials;0)
	//ARRAY LONGINT(<>MP_al_DiaryAccessID;0)
	//ARRAY TEXT(<>MP_at_DiaryAccessNames;0)
	C_LONGINT:C283($I)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LoadDiaryAccess")
//this has to be done in  a seperate process
//because other wise it would move the current record

If (Count parameters:C259>=1)
	READ ONLY:C145([PERSONNEL:11])
	ARRAY TEXT:C222(<>MP_at_DiaryAccessNames; Size of array:C274(<>MP_at_DiaryAcessInitials))
	ARRAY LONGINT:C221(<>MP_al_DiaryAccessID; Size of array:C274(<>MP_at_DiaryAcessInitials))
	For ($i; 1; Size of array:C274(<>MP_at_DiaryAcessInitials))
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>MP_at_DiaryAcessInitials{$i})
		<>MP_at_DiaryAccessNames{$i}:=[PERSONNEL:11]Name:2
		<>MP_al_DiaryAccessID{$i}:=[PERSONNEL:11]Personnel_ID:48
	End for 
End if 
ERR_MethodTrackerReturn("LoadDiaryAccess"; $_t_oldMethodName)