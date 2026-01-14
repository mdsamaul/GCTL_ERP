using System.ComponentModel.DataAnnotations;

namespace GCTL_ERP.Core.ViewModelDTOs.AccountDTO
{
    public class RegisterViewModelDTO
    {
        [Required(ErrorMessage = "পূর্ণ নাম আবশ্যক")]
        [Display(Name = "পূর্ণ নাম")]
        public string FullName { get; set; }

        [Required(ErrorMessage = "ইমেইল আবশ্যক")]
        [EmailAddress(ErrorMessage = "সঠিক ইমেইল দিন")]
        [Display(Name = "ইমেইল")]
        public string Email { get; set; }

        [Required(ErrorMessage = "পাসওয়ার্ড আবশ্যক")]
        [StringLength(100, ErrorMessage = "{0} কমপক্ষে {2} অক্ষরের হতে হবে", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "পাসওয়ার্ড")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "পাসওয়ার্ড নিশ্চিত করুন")]
        [Compare("Password", ErrorMessage = "পাসওয়ার্ড মিলছে না")]
        public string ConfirmPassword { get; set; }
    }
}
