// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GovProject {
    struct Project {
        string nama;
        string namaProject;
        uint256 biayaProject;
        string date;
    }

    mapping(uint256 => Project) public govProjects;
    uint256 public projectId;

    function addProject(
        string memory _nama,
        string memory _namaProject,
        uint256 _biayaProject,
        string memory _date
    ) public {
        projectId++;
        govProjects[projectId] = Project(_nama, _namaProject, _biayaProject, _date);
    }

   function getProjectDetails(uint256 _projectId)
    public
    view
    returns (string memory, string memory, uint256, string memory)
{
    require(_projectId > 0 && _projectId <= projectId, "Invalid project ID");
    // Retrieve project details using _projectId
    return (
        govProjects[_projectId].nama,
        govProjects[_projectId].namaProject,
        govProjects[_projectId].biayaProject,
        govProjects[_projectId].date
    );
}

}
