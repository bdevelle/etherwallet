<div ng-show="(objENS.status==ensModes.auction || objENS.status==ensModes.open || objENS.status==ensModes.reveal) && wallet!=null">

  <article class="row">

    <!-- Sidebar -->
    <section class="col-sm-4">
      <wallet-balance-drtv></wallet-balance-drtv>
    </section>
    <!-- / Sidebar -->

    <!-- Content -->
    <section class="col-sm-8">

      <!-- Title -->
      <div class="form-group">
        <h2>
          <span ng-show="objENS.status==ensModes.auction"> Place a Bid</span>
          <span ng-show="objENS.status==ensModes.open">Start an Auction</span>
          <span ng-show="objENS.status==ensModes.reveal">Reveal your Bid</span>
        </h2>
      </div>
      <!-- / Title -->

      <!-- Thing they copied -->
      <div class="form-group" ng-show="objENS.status==ensModes.reveal">
        <label>Long string of text you copied</label>
        <textarea class="form-control" name="Long string of text you copied" placeholder='{"name":"exrnnrxe","nameSHA3":"0x0001640f2629bb323fca95bc13744478d5307ba0aca6e3a13f803691923ff00d","owner":"0x7cb57b5a97eabe94205c07890be4c1ad31e486a8","value":"100000000000000000","secret":"alley symptom elephant","secretSHA3":"0xc3a2ae4fd788a17a2e9e63868efa1d3589f1e97cf54662dbbfb12150cb5f9859"}' ng-change="onLongStringChanged()" ng-model="longJsonString" ng-class="Validator.isJSON(longJsonString) ? 'is-valid' : 'is-invalid'"></textarea>
      </div>
      <!-- / Thing they copied -->


      <div class="form-group" ng-show="objENS.status==ensModes.reveal">
        <label class="strong">-- or --</label>
      </div>


      <!-- Name -->
      <label>Name</label>
      <div class="input-group">
        <input class="form-control" type="text" placeholder="myetherwallet" readonly ng-model="objENS.name"/>
        <div class="input-group-btn"><a class="btn btn-default">.eth</a></div>
      </div>
      <!-- / Name -->

      <!-- Bid Amount -->
      <h5>Bid Amount</h5>
      <p ng-show="objENS.status!=ensModes.reveal"><em><small>You must remember this to claim your name later.</small></em></p>
      <div class="input-group">
        <input class="form-control" type="number" placeholder="1 {{ajaxReq.type}}" ng-model="objENS.bidValue" ng-class="Validator.isPositiveNumber(objENS.bidValue) && objENS.bidValue >= 0.01 ? 'is-valid' : 'is-invalid'"/>
        <div class="input-group-btn"><a class="btn btn-default">{{ajaxReq.type}}</a></div>
      </div>
      <!-- / Bid Amount -->

      <!-- Disguise Bid -->
      <div ng-show="objENS.status!=ensModes.reveal">
        <h5>"Disguise Bid" Amount</h5>
        <p><em><small>You can send more actual bid to disguise it. This must be >= the Bid Amount</small></em></p>
        <div class="input-group">
          <input class="form-control" type="number" placeholder="2 {{ajaxReq.type}}" ng-model="objENS.dValue" ng-class="Validator.isPositiveNumber(objENS.dValue) && objENS.dValue >= objENS.bidValue ? 'is-valid' : 'is-invalid'"/>
          <div class="input-group-btn"><a class="btn btn-default">{{ajaxReq.type}}</a></div>
        </div>
      </div>
      <!-- / Disguise Bid  -->

      <!-- Your Secret -->
      <h5>Secret Phrase</h5>
      <p ng-show="objENS.status!=ensModes.reveal"><em><small>You must remember this to claim your name later (feel free to change this)</small></em></p>
      <div class="form-group">
        <input class="form-control" type="text" placeholder="word1 word2 word3" value="" ng-model="objENS.secret" ng-class="Validator.isPasswordLenValid(objENS.secret,0) ? 'is-valid' : 'is-invalid'"/>
      </div>
      <!-- / Your Secret  -->

      <!-- Button CTA -->
      <div class="form-group">
        <a class="btn btn-primary btn-block" ng-click="generateTx()">
          <span ng-show="objENS.status==ensModes.auction"> Place your Bid</span>
          <span ng-show="objENS.status==ensModes.open">Start the Auction</span>
          <span ng-show="objENS.status==ensModes.reveal">Reveal your Bid</span>
        </a>
      </div>
      <!-- / Button CTA -->

      <!-- After Sent: Place Bid / Start Auction -->
      <div class="form-group well" ng-show="objENS.txSent && (objENS.status==ensModes.auction || objENS.status==ensModes.open)">
        <h4 class="text-danger">If you haven't done so already, please screenshot & save the below information.</h4>
        <p>Please remember to come back to reveal your bid. If you fail to do so, you will not be refunded.</p>
        @@if (site === 'mew' ) { @@include( './ens-confirm-table.tpl', { "site": "mew" } ) }
        @@if (site === 'cx'  ) { @@include( './ens-confirm-table.tpl', { "site": "cx"  } ) }
      </div>
      <!-- / After Sent: Place Bid / Start Auction -->

      <!-- After Sent: Reveal -->
      <div class="form-group" ng-show="objENS.txSent && objENS.status==ensModes.reveal">
        <h4 class="text-success">You have successfully revealed your {{objENS.bidValue}} bid for {{objENS.name}}.eth.</h4>
        <p>Please return on <strong>{{objENS.registrationDate.toLocaleString()}}</strong> to finalize the auction and see if you won!</p>
      </div>
      <!-- / After Sent: Reveal -->


    </section>
    <!-- / Content -->

  </article>

</div>
