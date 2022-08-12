//%attributes = {}
If (False:C215)
	//Project Method Name:      MailP_Let_namepdf
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
	C_LONGINT:C283($_l_CharacterPosition; $_l_OK; $1; PrintCount)
	C_TEXT:C284($_t_DocPathAdd; $_t_DocPathName; $_t_DocumentPath; $_t_FileAdd; $_t_Filename; $_t_oldMethodName; $0; $2; DocPathName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MailP_Let_namepdf")
If ($2#"")
	$_t_Filename:=FileNamefromPath($2)
	
	If ($1>0)  //give the doc a name for the PDF
		$_t_Filename:=FileNamefromPath($2)
		$_t_DocumentPath:=PathFromPathName($2)
		$_l_CharacterPosition:=Position:C15("."; $_t_Filename)
		If ($_l_CharacterPosition>0)
			
			$_t_FileName:=Substring:C12($2; 1; $_l_CharacterPosition-1)
			$_t_FileAdd:=Substring:C12($2; $_l_CharacterPosition+1; Length:C16($2))
			$_t_FileName:=$_t_FileName+String:C10(PrintCount)+$_t_FileAdd
			$_t_DocPathName:=$_t_DocumentPath+$_t_Filename
		Else 
			$_t_DocPathName:=$2
			$_t_DocPathAdd:=""
			$_t_DocPathName:=$_t_DocPathName+String:C10(PrintCount)
		End if 
		$_l_CharacterPosition:=Position:C15(".PDF"; $_t_DocPathName)  //in case .pdf has not been added
		If ($_l_CharacterPosition=0) & ($1>0)  //will change to=1
			$_t_DocPathName:=$_t_DocPathName+".PDF"
		End if 
		DocPathName:=$_t_DocPathName
		$_l_OK:=PLUGCALL_PDFs("Define"; ->DocPathName)
		
	End if 
	
	$0:=$_t_DocPathName
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("MailP_Let_namepdf"; $_t_oldMethodName)
