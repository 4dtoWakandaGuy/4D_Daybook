//%attributes = {"invisible":true}

If (False:C215)
	//Project Method Name:      VER_SETVERSION
	//------------------ Method Notes ------------------
	//VER_SET VERSION BSW 14/08/02
	//This routine stores the version number as vX.X.X/X into the vers resource file
	//$1 : vLETTER 1
	//$2 : vLETTER 2
	//$3 : vLETTER 3
	//$4 : vLETTER 4
	//$5 : Development stage (Long Interger)
	//$6 Licence Version (like "5.0.000")
	//$7 pass 1 if data else default 0 means structure res
	//$8 Version Build Number (When compiling gets incremented)
	
	//------------------ Revision Control ----------------
	//Date Created:  03/01/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_DataVersionBlob; $_blb_PKPrivateKey; $_blb_PKPublicKey; $_blb_PrivateKey; $_blb_PublicKey; $_blb_Version; $_blb_Versionblob; $_blb_VersionerPublicKey; $LVersionblob; VER_blb_ResourceBlob; $_blb_DataVersionBlob)
	C_BLOB:C604($_blb_MyPrivateKey; $_blb_Version; $_blb_Versionblob; $_blb_VersionerPublicKey; VER_blb_ResourceBlob)
	C_BOOLEAN:C305($_bo_UpdateBuildOnly)
	C_DATE:C307($_d_CreatedOn; $_d_ModifiedDate; $_d_CreatedOn; $_d_ModifiedDate)
	C_LONGINT:C283(<>L_VersionBuildNo; <>VER_l_CustomerBuild; $_l_DataOffset; $_l_DevelopmentStage; $_l_LicenceNum; $_l_OLDReleaseVersion; $_l_OLDSetVersion; $_l_ReleaseVersion; $_l_ResourceCode; $_l_SetVersion; $_l_UpdateBuildOnly)
	C_LONGINT:C283($_l_VersionBuildNo; $5; $7; $8; $9; <>VER_l_CustomerBuild; $_l_DataOffset; $_l_DevelopmentStage; $_l_LicenceNum; $_l_OLDReleaseVersion; $_l_OLDSetVersion)
	C_LONGINT:C283($_l_ReleaseVersion; $_l_ResourceCode; $_l_SetVersion; $_l_UpdateBuildOnly; $_l_VersionBuildNo; $5; $7; $8; $9)
	C_TEXT:C284(<>VER_T_Version; $_t_DataFilePath; $_t_DataPath; $_t_DevVersionString; $_t_DirectorySymbol; $_t_FullVersionString; $_t_LicenceVersionString; $_t_OldDevVersion; $_t_OLDFullVersionString; $_t_OLDLicenceVersionString; $_t_oldMethodName)
	C_TEXT:C284($_t_OLDPlace; $_t_OldVersionComment; $_t_StructureFilePath; $_t_VER_LicenceVersionNUMString; $_t_VersionComment; $_t_VersionControlPath; $_t_VersionPart1; $_t_VersionPart2; $_t_VersionPart3; $_t_VersionPart4; $_t_VersionString)
	C_TEXT:C284($0; $1; $11; $2; $3; $4; $6; VER_t_LicenceVersionString; VER_T_PrivateKEYTEXT; VER_T_PublicKEYTEXT; $_t_DataFilePath)
	C_TEXT:C284($_t_DataPath; $_t_DevVersionString; $_t_DirectorySymbol; $_t_FullVersionString; $_t_LicenceVersionString; $_t_OldDevVersion; $_t_OLDFullVersionString; $_t_OLDLicenceVersionString; $_t_oldMethodName; $_t_OLDPlace; $_t_OldVersionComment)
	C_TEXT:C284($_t_Place; $_t_StructureFilePath; $_t_VER_LicenceVersionNUMString; $_t_VersionComment; $_t_VersionControlPath; $_t_VersionPart1; $_t_VersionPart2; $_t_VersionPart3; $_t_VersionPart4; $_t_VersionString; $1)
	C_TEXT:C284($10; $11; $2; $3; $4; $6; VER_T_PrivateKEYTEXT; VER_T_PublicKEYTEXT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("VER_SETVERSION")
While (Semaphore:C143("LOCKVERSION"))
	DelayTicks(2)
End while 
If (Not:C34(Is compiled mode:C492))
	If (Count parameters:C259>6)
		$_l_ResourceCode:=$7
	Else 
		$_l_ResourceCode:=0
	End if 
	
	If (Count parameters:C259>7)
		$_l_VersionBuildNo:=$8
	Else 
		$_l_VersionBuildNo:=0
	End if 
	
	If (Count parameters:C259>8)
		$_l_UpdateBuildOnly:=$9
	Else 
		$_l_UpdateBuildOnly:=0
	End if 
	
	START_SEMAPHORE("UpdateVersion")  //Only one can update version at a time
	
	Case of 
		: ($_l_ResourceCode=1)
			
			
			$_t_DataPath:=Data file:C490
			$_t_DataPath:=PathFromPathName($_t_DataPath)
			$_t_DirectorySymbol:=Directory_Symbol
			
			
			$_t_VersionControlPath:=$_t_DataPath+"Version_Control"
			$_t_DataFilePath:=$_t_VersionControlPath+".4DD"
			$_t_StructureFilePath:=$_t_VersionControlPath+".4DB"
			//TRACE
			If (Not:C34(Test path name:C476($_t_StructureFilePath)=Is a document:K24:1))
				
				Begin SQL
					CREATE DATABASE IF NOT EXISTS DATAFILE <<$_t_VersionControlPath>> auto_close;
					USE LOCAL DATABASE datafile <<$_t_VersionControlPath>> auto_close;
					CREATE TABLE IF NOT EXISTS VERSION_INFORMATION(VER_STRING BLOB, VER_DATA BLOB, VER_RELEASE BLOB);
					USE DATABASE SQL_INTERNAL;
				End SQL
			End if 
		Else 
			
			$_t_VersionControlPath:=Get 4D folder:C485(Current resources folder:K5:16)+"Version_Control"
			
			$_t_DataFilePath:=$_t_VersionControlPath+".4DD"
			$_t_StructureFilePath:=$_t_VersionControlPath+".4DB"
			
			
	End case 
	
	
	
	
End if 
//TRACE
If ($_l_UpdateBuildOnly=0)
	If (Count parameters:C259>=6)
		$_t_VersionPart1:=$1
		$_t_VersionPart2:=$2
		$_t_VersionPart3:=$3
		$_t_VersionPart4:=$4
		$_l_DevelopmentStage:=$5
		$_t_LicenceVersionString:=$6
		$_t_DevVersionString:=""
		$_t_VersionComment:=""
		If (Count parameters:C259>=10)
			$_t_DevVersionString:=$10
		End if 
		If (Count parameters:C259>=11)
			$_t_VersionComment:=$11
		End if 
		$_d_CreatedOn:=!1976-01-15!  //BSW perhaps when modulus was developed
		$_d_ModifiedDate:=Current date:C33(*)
		$_t_VersionString:=VER_String($_t_VersionPart1; $_t_VersionPart2; $_t_VersionPart3; $_t_VersionPart4; $_l_DevelopmentStage)
		$_t_FullVersionString:=$_t_VersionString+", "+"Released Date : "+String:C10(Current date:C33)
		$_l_SetVersion:=(Num:C11($_t_VersionPart1)*256)+(Num:C11($_t_VersionPart2)*16)+Num:C11($_t_VersionPart3)
		$_l_LicenceNum:=((Num:C11($_t_VersionPart4)\10)*16)+(Num:C11($_t_VersionPart4)%10)
		$_l_ReleaseVersion:=($_l_DevelopmentStage*2*4096)+$_l_LicenceNum
		
		If ($_t_LicenceVersionString="")
			$_t_LicenceVersionString:=VER_DefaultLicenceVersion
		End if 
		$_l_DataOffset:=0
		//NG..read the values first
		//```
		
		$_t_VersionControlPath:=Get 4D folder:C485(Current resources folder:K5:16)+"Version_Control"
		
		$_t_DataFilePath:=$_t_VersionControlPath+".4DD"
		$_t_StructureFilePath:=$_t_VersionControlPath+".4DB"
		//TRACE
		Begin SQL
			USE LOCAL DATABASE DATAFILE <<$_t_VersionControlPath>> auto_close;
			SELECT VER_STRING, VER_DATA, VER_RELEASE
			FROM VERSION_INFORMATION
			WHERE BIT_LENGTH(VER_STRING) > 0
			INTO :$_blb_Version, :$_blb_DataVersionBlob, :$_blb_Versionblob;
			
			USE DATABASE SQL_INTERNAL;
		End SQL
		
		VER_T_PrivateKEYTEXT:="-----BEGIN RSA PRIVATE KEY-----"+Char:C90(10)+"MIIEowIBAAKCAQEA8CRUazeyAI1h6XXqaqiCw+LrGDh7IWF7sLU7ku3N+MDLQuwj"+Char:C90(10)+"ois37yINtIwvmtQIAh1PSV+nYOSB/iz2QQXx7vd7R842dEgRRmnEvO5oxYGClbq9"+Char:C90(10)+"FxtWCgfkJ6fBvTyorHKolII203fNm1cebMbCuW3eCUs2Aja797B9jMGMMKJZWZ75"+Char:C90(10)+"LEq6r+a6saULruRz/vZXGkbNywqrjQEfplOfKpFNWI6lBNtsDgRGegoN/PT1COKz"+Char:C90(10)+"oxgfC/FGTCPYEcPUBLGoE+jjGfyik7BqMBU/Y9p1UlVlVriKokawXpUTJpASUcLB"+Char:C90(10)+"3lhC6PofD7sua03kJTExMBuYeQk1aS82+eIYPwIDAQABAoIBAAum96GsNirosVOO"+Char:C90(10)+"sS0zuAShQh8OvorEHCha4uUiPNhRIovAwYng5vnngRq9oqG0oB7aJTq+NXTyIYyf"+Char:C90(10)+"yeMl0rNxtr2pN+M0jAIKp80zFEphGmEBiqNQZEBgWaXC8heoldaoSZ3LI7XnHkbn"+Char:C90(10)+"V0aX7mLo/dkdmSVKWpyOJ8loqtDBN9m6VToQOnGd9/vqEKe/dQ7DMt3w0Fo7u0pJ"+Char:C90(10)+"VCwZgfYTS2RAbsb+TW+i1XqY1uNLC7Nk2+SrqyIkkmsyjxlHr87gI4N5QM/JQvx1"+Char:C90(10)+"yU+Cfw4zX2+8cljl2uMwUVVxHPltOt0suga9xkLn4jMK0lmopCvGQrzq/jUhQ+Dr"+Char:C90(10)+"/rmnmyECgYEA/+rVvvwQ8Ak49ZbYea8o2iG7Wu48bLNWhHfbrSrcMjIz5zrcEdRl"+Char:C90(10)+"OZa55J6cnNwX6VH+4SUYqXW9uUdAVmK8DyTgJDKmncuhbLjkgTg0sC02QUZ50EB+"+Char:C90(10)+"3gdBGmSK5Amge47C/IIO07QyyLzw4hSXcHieTw+MvQI7afVZ6czjxr0CgYEA8Dgw"+Char:C90(10)+"rW/d+ikPiGor1xXxT/HRjkYmNbKVwsY0D9TZy6zpraOrPzCyYQByONiqLsh58map"+Char:C90(10)+"6teNe48kDI38wr5DQPcB8lyHKJAzs5976Iq6/9yau69zFSO7yNvPchd3y7qLa2sf"+Char:C90(10)+"ZHpAA+vUxdODV+R6u3MPTMeLEEOldkPdDuT/OKsCgYBHjs1nkqnVxG5l1WEAXWbp"+Char:C90(10)+"32a43UaOCnNVpQIK4KIjcwAqVr30SlRnjuq5r1QRVEVnWyMOp0XHFIIRTYgC36bA"+Char:C90(10)+"AUqfNH58PtULRoO2UhYBcRLrm54yCeavhI3CqHxhmQODqP6ChodI0OkmUhZ00Ncr"+Char:C90(10)+"fr6dUrbCnt4oGY+jnUPPbQKBgQDRnBZNoImPWfjlzc8HVWxFl/qFLQz2Wih31r9i"+Char:C90(10)+"+RY6tV0KWQB6mSFtpxgEJnsJa4GNVKv78a7RHCwWkGb3/1FsBJ08QCTn7jxPBmD2"+Char:C90(10)+"nudhj7us/gFrdszLDZLMOVIdAV/akZTI9iuZwFTfchrvvLyjiFjXZF8iCAT/V2Qz"+Char:C90(10)+"NPrHFQKBgCaslIy5BtpzUER2CPBGLiDqRMqFjDBDfSLYrbt9D/pba93FHJUqH1wZ"+Char:C90(10)+"YcbevSGalnudYnxSIMG+grCb9x9SLw3o0eWAoGkSoeWIVU6E0O5vETmtANtX9GtI"+Char:C90(10)+"G/NIdxB6HjM6M/SfFvqWEU2UBBxSArq6s69eTKoEgNDYt22LTYKU"+Char:C90(10)+"-----END RSA PRIVATE KEY-----"+Char:C90(10)+""
		VER_T_PublicKEYTEXT:="-----BEGIN RSA PUBLIC KEY-----"+Char:C90(10)+"MIIBCgKCAQEA8CRUazeyAI1h6XXqaqiCw+LrGDh7IWF7sLU7ku3N+MDLQuwjois3"+Char:C90(10)+"7yINtIwvmtQIAh1PSV+nYOSB/iz2QQXx7vd7R842dEgRRmnEvO5oxYGClbq9FxtW"+Char:C90(10)+"CgfkJ6fBvTyorHKolII203fNm1cebMbCuW3eCUs2Aja797B9jMGMMKJZWZ75LEq6"+Char:C90(10)+"r+a6saULruRz/vZXGkbNywqrjQEfplOfKpFNWI6lBNtsDgRGegoN/PT1COKzoxgf"+Char:C90(10)+"C/FGTCPYEcPUBLGoE+jjGfyik7BqMBU/Y9p1UlVlVriKokawXpUTJpASUcLB3lhC"+Char:C90(10)+"6PofD7sua03kJTExMBuYeQk1aS82+eIYPwIDAQAB"+Char:C90(10)+"-----END RSA PUBLIC KEY-----"+Char:C90(10)+""
		TEXT TO BLOB:C554(VER_T_PrivateKEYTEXT; $_blb_MyPrivateKey)
		TEXT TO BLOB:C554(VER_T_PublicKEYTEXT; $_blb_VersionerPublicKey)
		DECRYPT BLOB:C690($_blb_Version; $_blb_VersionerPublicKey)
		DECRYPT BLOB:C690($_blb_DataVersionBlob; $_blb_VersionerPublicKey)
		DECRYPT BLOB:C690($_blb_Versionblob; $_blb_VersionerPublicKey)
		$_l_DataOffset:=0
		$_t_VER_LicenceVersionNUMString:=BLOB to text:C555($_blb_Version; Mac Pascal string:K22:8; $_l_DataOffset)
		
		$_l_DataOffset:=0
		
		$_l_OLDSetVersion:=BLOB to longint:C551($_blb_DataVersionBlob; Macintosh byte ordering:K22:2; $_l_DataOffset)
		$_l_OLDReleaseVersion:=BLOB to longint:C551($_blb_DataVersionBlob; Macintosh byte ordering:K22:2; $_l_DataOffset)
		$_t_OLDPlace:=BLOB to text:C555($_blb_DataVersionBlob; Mac Pascal string:K22:8; $_l_DataOffset)
		$_t_OLDLicenceVersionString:=BLOB to text:C555(VER_blb_ResourceBlob; Mac Pascal string:K22:8; $_l_DataOffset)
		$_t_OLDFullVersionString:=BLOB to text:C555($_blb_DataVersionBlob; Mac Pascal string:K22:8; $_l_DataOffset)
		
		
		
		
		
		//$FullVER_String:=BLOB to text($_blb_DataVersionBlob;Mac Pascal string;$_l_DataOffset)
		//$_t_DevVersionString:=""
		//$_t_VersionComment:=""
		
		If (BLOB size:C605($_blb_DataVersionBlob)>$_l_DataOffset)
			$_t_OldDevVersion:=BLOB to text:C555($_blb_DataVersionBlob; Mac Pascal string:K22:8; $_l_DataOffset)
			
			If (BLOB size:C605($_blb_DataVersionBlob)>$_l_DataOffset)
				$_t_OldVersionComment:=BLOB to text:C555(VER_blb_ResourceBlob; Mac Pascal string:K22:8; $_l_DataOffset)
				
			End if 
		End if 
		If ($_t_VersionComment="")
			$_t_VersionComment:=$_t_OldVersionComment
		End if 
		If ($_t_DevVersionString="")
			$_t_DevVersionString:=$_t_OldDevVersion
		End if 
		If ($_l_SetVersion=0)
			$_l_SetVersion:=$_l_OLDSetVersion
		End if 
		If ($_l_ReleaseVersion=0)
			$_l_ReleaseVersion:=$_l_OLDReleaseVersion
		End if 
		If ($_t_VersionString="")
			$_t_VersionString:=$_t_OLDLicenceVersionString
		End if 
		
		If ($_t_FullVersionString="")
			$_t_FullVersionString:=$_t_OLDFullVersionString
		End if 
		
		//```
		$_l_DataOffset:=0
		$_l_VersionBuildNo:=BLOB to longint:C551($_blb_Versionblob; Macintosh byte ordering:K22:2; $_l_DataOffset)
		
		
		
		
		//```
		$_l_DataOffset:=0  //Build number get set here
		
		SET BLOB SIZE:C606($_blb_Versionblob; 0)
		LONGINT TO BLOB:C550($_l_VersionBuildNo; $_blb_Versionblob; 1; *)
		//`````````````````
		SET BLOB SIZE:C606($_blb_DataVersionBlob; 0)
		$_l_DataOffset:=0
		$_t_Place:="Aylesbury Bucks UK"
		LONGINT TO BLOB:C550($_l_SetVersion; $_blb_DataVersionBlob; 1; *)
		LONGINT TO BLOB:C550($_l_ReleaseVersion; $_blb_DataVersionBlob; 1; *)
		TEXT TO BLOB:C554($_t_Place; $_blb_DataVersionBlob; Mac Pascal string:K22:8; *)
		TEXT TO BLOB:C554($_t_VersionString; $_blb_DataVersionBlob; Mac Pascal string:K22:8; *)
		TEXT TO BLOB:C554($_t_FullVersionString; $_blb_DataVersionBlob; Mac Pascal string:K22:8; *)
		TEXT TO BLOB:C554($_t_DevVersionString; $_blb_DataVersionBlob; Mac Pascal string:K22:8; *)
		TEXT TO BLOB:C554($_t_VersionComment; $_blb_DataVersionBlob; Mac Pascal string:K22:8; *)
		
		
		
		
		
		
		//````
		
		$_l_DataOffset:=0  //Licence version get set here
		
		SET BLOB SIZE:C606($_blb_Version; 0)
		TEXT TO BLOB:C554($_t_VER_LicenceVersionNUMString; $_blb_Version; Mac Pascal string:K22:8; *)
		
		
		VER_T_PrivateKEYTEXT:="-----BEGIN RSA PRIVATE KEY-----"+Char:C90(10)+"MIIEowIBAAKCAQEA8CRUazeyAI1h6XXqaqiCw+LrGDh7IWF7sLU7ku3N+MDLQuwj"+Char:C90(10)+"ois37yINtIwvmtQIAh1PSV+nYOSB/iz2QQXx7vd7R842dEgRRmnEvO5oxYGClbq9"+Char:C90(10)+"FxtWCgfkJ6fBvTyorHKolII203fNm1cebMbCuW3eCUs2Aja797B9jMGMMKJZWZ75"+Char:C90(10)+"LEq6r+a6saULruRz/vZXGkbNywqrjQEfplOfKpFNWI6lBNtsDgRGegoN/PT1COKz"+Char:C90(10)+"oxgfC/FGTCPYEcPUBLGoE+jjGfyik7BqMBU/Y9p1UlVlVriKokawXpUTJpASUcLB"+Char:C90(10)+"3lhC6PofD7sua03kJTExMBuYeQk1aS82+eIYPwIDAQABAoIBAAum96GsNirosVOO"+Char:C90(10)+"sS0zuAShQh8OvorEHCha4uUiPNhRIovAwYng5vnngRq9oqG0oB7aJTq+NXTyIYyf"+Char:C90(10)+"yeMl0rNxtr2pN+M0jAIKp80zFEphGmEBiqNQZEBgWaXC8heoldaoSZ3LI7XnHkbn"+Char:C90(10)+"V0aX7mLo/dkdmSVKWpyOJ8loqtDBN9m6VToQOnGd9/vqEKe/dQ7DMt3w0Fo7u0pJ"+Char:C90(10)+"VCwZgfYTS2RAbsb+TW+i1XqY1uNLC7Nk2+SrqyIkkmsyjxlHr87gI4N5QM/JQvx1"+Char:C90(10)+"yU+Cfw4zX2+8cljl2uMwUVVxHPltOt0suga9xkLn4jMK0lmopCvGQrzq/jUhQ+Dr"+Char:C90(10)+"/rmnmyECgYEA/+rVvvwQ8Ak49ZbYea8o2iG7Wu48bLNWhHfbrSrcMjIz5zrcEdRl"+Char:C90(10)+"OZa55J6cnNwX6VH+4SUYqXW9uUdAVmK8DyTgJDKmncuhbLjkgTg0sC02QUZ50EB+"+Char:C90(10)+"3gdBGmSK5Amge47C/IIO07QyyLzw4hSXcHieTw+MvQI7afVZ6czjxr0CgYEA8Dgw"+Char:C90(10)+"rW/d+ikPiGor1xXxT/HRjkYmNbKVwsY0D9TZy6zpraOrPzCyYQByONiqLsh58map"+Char:C90(10)+"6teNe48kDI38wr5DQPcB8lyHKJAzs5976Iq6/9yau69zFSO7yNvPchd3y7qLa2sf"+Char:C90(10)+"ZHpAA+vUxdODV+R6u3MPTMeLEEOldkPdDuT/OKsCgYBHjs1nkqnVxG5l1WEAXWbp"+Char:C90(10)+"32a43UaOCnNVpQIK4KIjcwAqVr30SlRnjuq5r1QRVEVnWyMOp0XHFIIRTYgC36bA"+Char:C90(10)+"AUqfNH58PtULRoO2UhYBcRLrm54yCeavhI3CqHxhmQODqP6ChodI0OkmUhZ00Ncr"+Char:C90(10)+"fr6dUrbCnt4oGY+jnUPPbQKBgQDRnBZNoImPWfjlzc8HVWxFl/qFLQz2Wih31r9i"+Char:C90(10)+"+RY6tV0KWQB6mSFtpxgEJnsJa4GNVKv78a7RHCwWkGb3/1FsBJ08QCTn7jxPBmD2"+Char:C90(10)+"nudhj7us/gFrdszLDZLMOVIdAV/akZTI9iuZwFTfchrvvLyjiFjXZF8iCAT/V2Qz"+Char:C90(10)+"NPrHFQKBgCaslIy5BtpzUER2CPBGLiDqRMqFjDBDfSLYrbt9D/pba93FHJUqH1wZ"+Char:C90(10)+"YcbevSGalnudYnxSIMG+grCb9x9SLw3o0eWAoGkSoeWIVU6E0O5vETmtANtX9GtI"+Char:C90(10)+"G/NIdxB6HjM6M/SfFvqWEU2UBBxSArq6s69eTKoEgNDYt22LTYKU"+Char:C90(10)+"-----END RSA PRIVATE KEY-----"+Char:C90(10)+""
		VER_T_PublicKEYTEXT:="-----BEGIN RSA PUBLIC KEY-----"+Char:C90(10)+"MIIBCgKCAQEA8CRUazeyAI1h6XXqaqiCw+LrGDh7IWF7sLU7ku3N+MDLQuwjois3"+Char:C90(10)+"7yINtIwvmtQIAh1PSV+nYOSB/iz2QQXx7vd7R842dEgRRmnEvO5oxYGClbq9FxtW"+Char:C90(10)+"CgfkJ6fBvTyorHKolII203fNm1cebMbCuW3eCUs2Aja797B9jMGMMKJZWZ75LEq6"+Char:C90(10)+"r+a6saULruRz/vZXGkbNywqrjQEfplOfKpFNWI6lBNtsDgRGegoN/PT1COKzoxgf"+Char:C90(10)+"C/FGTCPYEcPUBLGoE+jjGfyik7BqMBU/Y9p1UlVlVriKokawXpUTJpASUcLB3lhC"+Char:C90(10)+"6PofD7sua03kJTExMBuYeQk1aS82+eIYPwIDAQAB"+Char:C90(10)+"-----END RSA PUBLIC KEY-----"+Char:C90(10)+""
		TEXT TO BLOB:C554(VER_T_PrivateKEYTEXT; $_blb_MyPrivateKey)
		TEXT TO BLOB:C554(VER_T_PublicKEYTEXT; $_blb_VersionerPublicKey)
		ENCRYPT BLOB:C689($_blb_Version; $_blb_MyPrivateKey)
		ENCRYPT BLOB:C689($_blb_DataVersionBlob; $_blb_MyPrivateKey)
		ENCRYPT BLOB:C689($_blb_Versionblob; $_blb_MyPrivateKey)
		//TRACE
		Begin SQL
			USE LOCAL DATABASE DATAFILE <<$_t_VersionControlPath>> auto_close;
			Update VERSION_INFORMATION
			SET VER_STRING = <<$_blb_Version>>, VER_DATA = <<$_blb_DataVersionBlob>>, VER_RELEASE = <<$_blb_Versionblob>>
			WHERE BIT_LENGTH(VER_STRING) > 0;
			USE DATABASE SQL_INTERNAL;
		End SQL
		<>VER_l_CustomerBuild:=$_l_VersionBuildNo
	End if 
Else 
	
	$_l_DataOffset:=0  //update build only
	SET BLOB SIZE:C606($_blb_Versionblob; 0)
	LONGINT TO BLOB:C550($_l_VersionBuildNo; $_blb_Versionblob; 1; *)
	<>VER_l_CustomerBuild:=$_l_VersionBuildNo
	
End if 
Stop_Semaphore("UpdateVersion")
CLEAR SEMAPHORE:C144("LOCKVERSION")
ERR_MethodTrackerReturn("VER_SETVERSION"; $_t_oldMethodName)
