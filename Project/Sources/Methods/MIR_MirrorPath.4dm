//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_MirrorPath
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
	C_TEXT:C284($_t_Filename; $_t_oldMethodName; $_t_StructureFile; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_MirrorPath")


$_t_Filename:=$1



//Folder separator:=DB_DirSymbol 
$_t_StructureFile:=PathFromPathName(Structure file:C489)
Case of 
	: ($_t_Filename="Backup")
		$0:=$_t_StructureFile+"Preferences"+Folder separator:K24:12+"Backup"+Folder separator:K24:12+"Backup.xml"
	: ($_t_Filename="Multiples")
		$0:=$_t_StructureFile+"Preferences"+Folder separator:K24:12+"Mirror"+Folder separator:K24:12
		
	Else 
		$0:=$_t_StructureFile+"Preferences"+Folder separator:K24:12+"Mirror"+Folder separator:K24:12+"Settings.xml"
		
End case 

//End of method
ERR_MethodTrackerReturn("MIR_MirrorPath"; $_t_oldMethodName)
