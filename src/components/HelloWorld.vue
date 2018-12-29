<template>
  <div class="hello">
    <h1>Here is the value stored on the blockchain: {{currentValue}}</h1>
    <b-field label="Update the value">
      <b-input size="is-small" class="setValue" v-model="newContractValue"></b-input>
    </b-field>
    <h1>{{loading}}</h1>
    <button class="button is-primary" @click="setValue">Update</button>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue, Watch } from "vue-property-decorator";
import { Qtum } from "qtumjs";
const repoData = require("../../../solar.development.json");
const qtum = new Qtum("http://qtum:test@localhost:3889", repoData);
const myToken = qtum.contract("MyContract.sol");

@Component
export default class HelloWorld extends Vue {
  currentValue: string = "";
  newContractValue: string = "";
  loading: string = "";
  isValueUpdated: boolean = false;

  async getValue() {
    let result = await myToken.call("get");
    let output = result.outputs[0];
    this.currentValue = output;
  }

  async setValue() {
    this.loading = "Transaction request is being processed";
    const result = await myToken.send("set", [this.newContractValue]);
    const newResult = await result.confirm(1, updatedTx => {
      this.loading = "";
      this.isValueUpdated = true;
    });
  }

  @Watch("isValueUpdated")
  onPropertyChanged(newValue: boolean, oldValue: boolean) {
    if (newValue == true) {
      window.location.reload(true);
    }
  }

  mounted() {
    this.getValue();
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.setValue {
  max-width: 400px;
  margin: 0 auto;
}
</style>
