using Scylla;

namespace VaultsCoalition
{
    using System.Collections;
    using System.Collections.Generic;
    using UnityEngine;

    public class SymlinkTesterInternal : MonoBehaviour
    {
        // Start is called before the first frame update
        void Start()
        {
            Debug.Log(SymlinkTester.tester);
            Debug.Log(SymlinkTester2.tester2);
        }

        // Update is called once per frame
        void Update()
        {
        
        }
    }
}

