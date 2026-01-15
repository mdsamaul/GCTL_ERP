using System;
using System.Collections.Generic;
using System.Text;

namespace GCTL_ERP.Core.ViewModelDTOs.AccountDTO
{
    public class AuthViewModel
    {
        public LoginViewModelDTO? Login { get; set; }
        public RegisterViewModelDTO? Register { get; set; }
    }
}
