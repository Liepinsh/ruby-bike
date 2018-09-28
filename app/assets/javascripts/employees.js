
$(document).ready(function() {
    setInterval(function(){
        $.ajax({
            url: "/employees/employee_ajax"
        }).done(function(employees) {
            for(let employee of employees) {
                let $employeeElement = $('[data-employee-id="' + employee.id + '"]');
                $employeeElement.find('[data-employee-attribute="name"]').text(employee.name);
                $employeeElement.find('[data-employee-attribute="surname"]').text(employee.surname);
                $employeeElement.find('[data-employee-attribute="full_name"]').text(employee.full_name);
            }
        });
    }, 3000);
});