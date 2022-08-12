//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_rootDirPathGet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 16:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>PDF995_rootDirStr; $_t_oldMethodName; $_t_OSVersionName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_rootDirPathGet")

If (Is Windows:C1573)
	PDF995_constantsInit
	
	If (<>PDF995_rootDirStr="")
		
		If (Application type:C494=4D Remote mode:K5:5)
			//◊PDF995_rootDirStr:=PDF995_filePathToDirPath (Application file)`Wed, May 25, 2005 bwalia: changed to use system folder cmd
			
			
			
			$_t_OSVersionName:=DBGetOSVersion  //added 28/10/08 v631b120c -kmw
			
			If ($_t_OSVersionName="@Windows@") & ($_t_OSVersionName="@Vista@")  //changed 28/10/08 v631b120c -kmw
				
				<>PDF995_rootDirStr:=System folder:C487(User preferences_user:K41:4)+"Documents\\"
				
			Else 
				<>PDF995_rootDirStr:=System folder:C487(User preferences_user:K41:4)+"My Documents\\"
			End if 
			
			If (Test path name:C476(<>PDF995_rootDirStr)#Is a folder:K24:2)
				CREATE FOLDER:C475(<>PDF995_rootDirStr)
			End if 
		Else 
			<>PDF995_rootDirStr:=PDF995_filePathToDirPath(Data file:C490)  //◊PDF995_rootDirStr:=PDF995_filePathToDirPath (Structure file)
		End if 
		
		<>PDF995_rootDirStr:=<>PDF995_rootDirStr+PDF995_rootDirNameGet+"\\"
		
		If (Test path name:C476(<>PDF995_rootDirStr)#Is a folder:K24:2)
			CREATE FOLDER:C475(<>PDF995_rootDirStr)
		End if 
	End if 
End if 

$0:=<>PDF995_rootDirStr

ERR_MethodTrackerReturn("PDF995_rootDirPathGet"; $_t_oldMethodName)
