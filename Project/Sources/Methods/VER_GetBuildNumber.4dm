//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      VER_GetBuildNumber
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 15:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	C_BLOB:C604($_blb_VersionBlob; $_blb_VersionPublicKey; $VER_Blob; $Versionblob; $_blb_myPrivateKey; $_blb_VersionBlob; $_blb_VersionPublicKey)
	C_LONGINT:C283($_l_offset; $0; <>VER_l_CustomerBuild; $_l_offset; VER_l_CustomerBuild)
	C_TEXT:C284($_t_oldMethodName; $_t_StructurePath; $_t_VersionControlPath; VER_T_PrivateKEYTEXT; VER_T_PublicKEYTEXT; $_t_DataFIlePath; $_t_oldMethodName; $_t_StructurePath; $_t_VersionControlPath; VER_T_PrivateKEYTEXT; VER_T_PublicKEYTEXT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("VER_GetBuildNumber")

Case of 
	: (Application type:C494=4D Remote mode:K5:5)  //Get Version from server structure res file
		VER_l_CustomerBuild:=0
		GET PROCESS VARIABLE:C371(-1; <>VER_l_CustomerBuild; VER_l_CustomerBuild)
		
	Else 
		If (<>VER_l_CustomerBuild=0)
			
			$_t_VersionControlPath:=Get 4D folder:C485(Current resources folder:K5:16)+"Version_Control"
			$_t_DataFIlePath:=$_t_VersionControlPath+".4DD"
			$_t_StructurePath:=$_t_VersionControlPath+".4DB"
			
			Begin SQL
				USE LOCAL DATABASE DATAFILE <<$_t_VersionControlPath>> auto_close;
				SELECT VER_STRING, VER_DATA, VER_RELEASE
				FROM VERSION_INFORMATION
				WHERE BIT_LENGTH(VER_STRING) > 0
				INTO :$VER_Blob, :$Versionblob, :$_blb_VersionBlob;
				
				USE DATABASE SQL_INTERNAL;
			End SQL
			
			VER_T_PrivateKEYTEXT:="-----BEGIN RSA PRIVATE KEY-----"+Char:C90(10)+"MIIEowIBAAKCAQEA8CRUazeyAI1h6XXqaqiCw+LrGDh7IWF7sLU7ku3N+MDLQuwj"+Char:C90(10)+"ois37yINtIwvmtQIAh1PSV+nYOSB/iz2QQXx7vd7R842dEgRRmnEvO5oxYGClbq9"+Char:C90(10)+"FxtWCgfkJ6fBvTyorHKolII203fNm1cebMbCuW3eCUs2Aja797B9jMGMMKJZWZ75"+Char:C90(10)+"LEq6r+a6saULruRz/vZXGkbNywqrjQEfplOfKpFNWI6lBNtsDgRGegoN/PT1COKz"+Char:C90(10)+"oxgfC/FGTCPYEcPUBLGoE+jjGfyik7BqMBU/Y9p1UlVlVriKokawXpUTJpASUcLB"+Char:C90(10)+"3lhC6PofD7sua03kJTExMBuYeQk1aS82+eIYPwIDAQABAoIBAAum96GsNirosVOO"+Char:C90(10)+"sS0zuAShQh8OvorEHCha4uUiPNhRIovAwYng5vnngRq9oqG0oB7aJTq+NXTyIYyf"+Char:C90(10)+"yeMl0rNxtr2pN+M0jAIKp80zFEphGmEBiqNQZEBgWaXC8heoldaoSZ3LI7XnHkbn"+Char:C90(10)+"V0aX7mLo/dkdmSVKWpyOJ8loqtDBN9m6VToQOnGd9/vqEKe/dQ7DMt3w0Fo7u0pJ"+Char:C90(10)+"VCwZgfYTS2RAbsb+TW+i1XqY1uNLC7Nk2+SrqyIkkmsyjxlHr87gI4N5QM/JQvx1"+Char:C90(10)+"yU+Cfw4zX2+8cljl2uMwUVVxHPltOt0suga9xkLn4jMK0lmopCvGQrzq/jUhQ+Dr"+Char:C90(10)+"/rmnmyECgYEA/+rVvvwQ8Ak49ZbYea8o2iG7Wu48bLNWhHfbrSrcMjIz5zrcEdRl"+Char:C90(10)+"OZa55J6cnNwX6VH+4SUYqXW9uUdAVmK8DyTgJDKmncuhbLjkgTg0sC02QUZ50EB+"+Char:C90(10)+"3gdBGmSK5Amge47C/IIO07QyyLzw4hSXcHieTw+MvQI7afVZ6czjxr0CgYEA8Dgw"+Char:C90(10)+"rW/d+ikPiGor1xXxT/HRjkYmNbKVwsY0D9TZy6zpraOrPzCyYQByONiqLsh58map"+Char:C90(10)+"6teNe48kDI38wr5DQPcB8lyHKJAzs5976Iq6/9yau69zFSO7yNvPchd3y7qLa2sf"+Char:C90(10)+"ZHpAA+vUxdODV+R6u3MPTMeLEEOldkPdDuT/OKsCgYBHjs1nkqnVxG5l1WEAXWbp"+Char:C90(10)+"32a43UaOCnNVpQIK4KIjcwAqVr30SlRnjuq5r1QRVEVnWyMOp0XHFIIRTYgC36bA"+Char:C90(10)+"AUqfNH58PtULRoO2UhYBcRLrm54yCeavhI3CqHxhmQODqP6ChodI0OkmUhZ00Ncr"+Char:C90(10)+"fr6dUrbCnt4oGY+jnUPPbQKBgQDRnBZNoImPWfjlzc8HVWxFl/qFLQz2Wih31r9i"+Char:C90(10)+"+RY6tV0KWQB6mSFtpxgEJnsJa4GNVKv78a7RHCwWkGb3/1FsBJ08QCTn7jxPBmD2"+Char:C90(10)+"nudhj7us/gFrdszLDZLMOVIdAV/akZTI9iuZwFTfchrvvLyjiFjXZF8iCAT/V2Qz"+Char:C90(10)+"NPrHFQKBgCaslIy5BtpzUER2CPBGLiDqRMqFjDBDfSLYrbt9D/pba93FHJUqH1wZ"+Char:C90(10)+"YcbevSGalnudYnxSIMG+grCb9x9SLw3o0eWAoGkSoeWIVU6E0O5vETmtANtX9GtI"+Char:C90(10)+"G/NIdxB6HjM6M/SfFvqWEU2UBBxSArq6s69eTKoEgNDYt22LTYKU"+Char:C90(10)+"-----END RSA PRIVATE KEY-----"+Char:C90(10)+""
			VER_T_PublicKEYTEXT:="-----BEGIN RSA PUBLIC KEY-----"+Char:C90(10)+"MIIBCgKCAQEA8CRUazeyAI1h6XXqaqiCw+LrGDh7IWF7sLU7ku3N+MDLQuwjois3"+Char:C90(10)+"7yINtIwvmtQIAh1PSV+nYOSB/iz2QQXx7vd7R842dEgRRmnEvO5oxYGClbq9FxtW"+Char:C90(10)+"CgfkJ6fBvTyorHKolII203fNm1cebMbCuW3eCUs2Aja797B9jMGMMKJZWZ75LEq6"+Char:C90(10)+"r+a6saULruRz/vZXGkbNywqrjQEfplOfKpFNWI6lBNtsDgRGegoN/PT1COKzoxgf"+Char:C90(10)+"C/FGTCPYEcPUBLGoE+jjGfyik7BqMBU/Y9p1UlVlVriKokawXpUTJpASUcLB3lhC"+Char:C90(10)+"6PofD7sua03kJTExMBuYeQk1aS82+eIYPwIDAQAB"+Char:C90(10)+"-----END RSA PUBLIC KEY-----"+Char:C90(10)+""
			TEXT TO BLOB:C554(VER_T_PrivateKEYTEXT; $_blb_myPrivateKey)
			TEXT TO BLOB:C554(VER_T_PublicKEYTEXT; $_blb_VersionPublicKey)
			
			DECRYPT BLOB:C690($_blb_VersionBlob; $_blb_VersionPublicKey)
			
			VER_l_CustomerBuild:=BLOB to longint:C551($_blb_VersionBlob; Macintosh byte ordering:K22:2; $_l_offset)
			
		Else 
			
			VER_l_CustomerBuild:=<>VER_l_CustomerBuild
		End if 
		
		
End case 

<>VER_l_CustomerBuild:=VER_l_CustomerBuild

$0:=VER_l_CustomerBuild
ERR_MethodTrackerReturn("VER_GetBuildNumber"; $_t_oldMethodName)
